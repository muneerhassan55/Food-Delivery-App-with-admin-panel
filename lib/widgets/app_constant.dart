// Stripe keys are passed at build time, never committed:
// flutter run --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_... --dart-define=STRIPE_SECRET_KEY=sk_test_...
const String publishableKey = String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
const String secretKey = String.fromEnvironment('STRIPE_SECRET_KEY');
