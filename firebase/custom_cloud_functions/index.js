const admin = require("firebase-admin/app");
admin.initializeApp();

const calculateCartTotal = require("./calculate_cart_total.js");
exports.calculateCartTotal = calculateCartTotal.calculateCartTotal;
const clearCart = require("./clear_cart.js");
exports.clearCart = clearCart.clearCart;
