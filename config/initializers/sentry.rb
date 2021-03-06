Sentry.init do |config|
  config.dsn = "https://a0d4f76dfc8b4311ade2cdbac5ef2025@o1054788.ingest.sentry.io/6040416"
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
