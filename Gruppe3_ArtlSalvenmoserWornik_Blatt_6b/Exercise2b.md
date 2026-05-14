# Visualisierung von Query 2: Entwicklung der Internetnutzung in Thailand vom Beginn des Beobachtungszeitraums bis heute

>`SELECT year, internet_share
>FROM internet_usage_history
>WHERE code = 'THA'
>UNION ALL 
>SELECT year, internet_share
>FROM internet_usage
>WHERE code = 'THA'
>ORDER BY year;`

<img src=Ex0602b.png width=auto></img>