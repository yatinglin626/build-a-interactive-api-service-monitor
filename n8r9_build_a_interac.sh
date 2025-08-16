#!/bin/bash

# API Service Monitor

# Set API endpoint and credentials
API_ENDPOINT="https://example.com/api"
USERNAME="monitor_user"
PASSWORD="monitor_password"

# Function to get API token
get_token() {
  curl -s -X POST \
  ${API_ENDPOINT}/auth/token \
  -H 'Content-Type: application/json' \
  -d '{"username":"'${USERNAME}'","password":"'${PASSWORD}'"}' | jq -r '.token'
}

# Function to get API status
get_status() {
  curl -s -X GET \
  ${API_ENDPOINT}/status \
  -H 'Authorization: Bearer '${TOKEN}'' \
  -H 'Content-Type: application/json'
}

# Function to get API metrics
get_metrics() {
  curl -s -X GET \
  ${API_ENDPOINT}/metrics \
  -H 'Authorization: Bearer '${TOKEN}'' \
  -H 'Content-Type: application/json'
}

# Main program
TOKEN=$(get_token)
while true; do
  clear
  echo "API Status:"
  get_status
  echo ""
  echo "API Metrics:"
  get_metrics
  echo ""
  sleep 5
done