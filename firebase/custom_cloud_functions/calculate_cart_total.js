const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.calculateCartTotal = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Must be logged in",
    );
  }

  const userId = context.auth.uid;
  const snapshot = await admin
    .firestore()
    .collection("cart")
    .where("userId", "==", userId)
    .get();

  let total = 0;
  snapshot.forEach((doc) => {
    const price = parseFloat(doc.data().service_price.replace("$", ""));
    if (!isNaN(price)) total += price;
  });

  const tax = total * 0.1;
  return {
    total: parseFloat((total + tax).toFixed(2)),
    subtotal: parseFloat(total.toFixed(2)),
    tax: parseFloat(tax.toFixed(2)),
  };
});
