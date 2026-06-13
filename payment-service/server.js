const express = require("express");
const cors = require("cors");
const { Kafka } = require("kafkajs");

const app = express();
const PORT = process.env.PORT || 8084;
const kafka = new Kafka({
  clientId: "payment-service",
  brokers: [process.env.KAFKA_BROKERS || "localhost:9092"]
});
const producer = kafka.producer();
const consumer = kafka.consumer({ groupId: "payment-service-group" });

app.use(cors());
app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({ status: "UP", service: "payment-service" });
});

async function publishPaymentEvent(event) {
  await producer.send({
    topic: "payment-events",
    messages: [
      {
        key: event.orderId,
        value: JSON.stringify(event)
      }
    ]
  });
}

async function processPayment(event) {
  const amount = Number(event.amount || 0);
  const transactionId = `TXN-${Date.now()}`;

  const result = {
    status: amount > 0 ? "SUCCESS" : "FAILED",
    message: amount > 0 ? "Payment processed successfully" : "Invalid payment amount",
    transactionId,
    orderId: event.orderId,
    userEmail: event.userEmail,
    paidAmount: amount,
    paidAt: Date.now()
  };

  await publishPaymentEvent({
    ...result,
    totalItems: event.totalItems || 0,
    source: "payment-service"
  });

  return result;
}

app.post("/api/payments/process", async (req, res) => {
  const { orderId, userEmail, amount, totalItems } = req.body || {};

  if (!orderId || !userEmail || !amount || !totalItems) {
    return res.status(400).json({
      status: "FAILED",
      message: "Missing required payment fields"
    });
  }

  // Demo payment flow: approve positive amount payments.
  if (Number(amount) <= 0) {
    return res.status(400).json({
      status: "FAILED",
      message: "Invalid payment amount"
    });
  }

  const result = await processPayment({ orderId, userEmail, amount, totalItems });

  return res.status(result.status === "SUCCESS" ? 200 : 400).json(result);
});

async function startKafkaConsumer() {
  await producer.connect();
  await consumer.connect();
  await consumer.subscribe({ topic: "order-events", fromBeginning: false });

  await consumer.run({
    eachMessage: async ({ message }) => {
      try {
        const payload = JSON.parse(message.value?.toString() || "{}");
        if (payload.status && payload.status !== "PENDING_PAYMENT") {
          return;
        }
        console.log("Received order event", payload);
        await processPayment(payload);
      } catch (error) {
        console.error("Kafka event processing failed", error);
      }
    }
  });
}

startKafkaConsumer().catch((error) => {
  console.error("Kafka consumer startup failed", error);
});

app.listen(PORT, () => {
  console.log(`Payment service running on port ${PORT}`);
});
