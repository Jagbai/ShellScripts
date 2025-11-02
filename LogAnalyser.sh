#!bin/sh

# Top 5 IP addresses with the most requests
echo Top 5 IP addresses with the most requests:
awk '{print($1)}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{print($2 "  -  " $1 "  requests")}'
echo ""
# Top 5 mosmt requested paths 
echo Top 5 most requested paths:
awk '{if ($7 != "/")print($7)}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{print($2 "  -  " $1 "  requests")}'
echo ""
echo Top 5 response status codes:
awk '{if ($9 != "-" && $9 != "\"-\"") print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{print($2 "  -  " $1 "  requests")}'