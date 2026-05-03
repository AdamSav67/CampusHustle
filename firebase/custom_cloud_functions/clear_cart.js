const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.clearCart = functions.https.onCall(async (data, context) => {
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

  const batch = admin.firestore().batch();
  snapshot.forEach((doc) => batch.delete(doc.ref));
  await batch.commit();

  return { success: true };
});
