if [ ! -n "$WERCKER_DATADOG_EVENT_TOKEN" ]; then
  error 'Please specify token property'
  exit 1
fi

if [ ! -n "$WERCKER_DATADOG_EVENT_TITLE" ]; then
  error 'Please specify title property'
  exit 1
fi

if [ ! -n "$WERCKER_DATADOG_EVENT_TEXT" ]; then
  error 'Please specify text property'
  exit 1
fi

if [ ! -n "$WERCKER_DATADOG_EVENT_PRIORITY" ]; then
  error 'Please specify priority property'
  exit 1
fi

if [ ! -n "$WERCKER_DATADOG_EVENT_TAGS" ]; then
  error 'Please specify tags property'
  exit 1
fi

if [ ! -n "$WERCKER_DATADOG_EVENT_ALERT_TYPE" ]; then
  error 'Please specify alert_type property'
  exit 1
fi


curl  -X POST -H "Content-type: application/json" \
-d "{
      \"title\":            \"$WERCKER_DATADOG_EVENT_TITLE\",
      \"text\":             \"$WERCKER_DATADOG_EVENT_TEXT\",
      \"priority\":         \"$WERCKER_DATADOG_EVENT_PRIORITY\",
      \"tags\":             \"$WERCKER_DATADOG_EVENT_TAGS\",
      \"alert_type\":       \"$WERCKER_DATADOG_EVENT_ALERT_TYPE\",
  }" \
"https://app.datadoghq.com/api/v1/events?api_key=$WERCKER_DATADOG_EVENT_TOKEN"
