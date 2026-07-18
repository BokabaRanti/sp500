# sp500
sp500 dataset

**ABOUT PROJECT**<BR>
This project explores analyst ratings and price target accuracy for companies in the S&P 500. The dataset captures analyst recommendations, projected price targets, and actual market performance, enabling a deeper look into how reliable financial forecasts are in practice.<BR>

**PROJECT OBJECTIVES**<BR>
Assess the accuracy of analyst price targets compared to actual stock prices.<BR>
Identify patterns in analyst ratings (Buy, Hold, Sell, etc.) across different sectors.<BR>
Detect inconsistencies, missing values, and anomalies in the dataset.<BR>
Build a clean, validated dataset ready for downstream analysis and visualization.<BR>

**TOOLS USED TO CLEAN THAT DATA**<BR>
Databricks SQL<br> 
Chatgpt<br>
Copilot<br>

**PROCESS**<br>
Data Ingestion: Loaded raw CSV into Databricks<br>

**INSIGHTS**<br>
Analyst ratings tend to cluster around “Buy” and “Hold,” with fewer “Sell” recommendations.<br>
Price targets often skew optimistic compared to actual market performance.<br>
Data quality issues (nulls, duplicates, invalid formats) can significantly distort analysis if not addressed.<br>

**ENGAGEMENT**<br>
This dataset provides a foundation for:<br>
Financial analysts evaluating forecast reliability.<br>
Data scientists building predictive models on stock performance.<br>
Students and researchers studying market behavior and analyst bias.<br>

**WHAT I HAVE LEARNED FROM THIS PROJECT**<br>
How to use Databricks SQL for large-scale data cleaning and validation.<br>
The importance of enforcing strict rules for categorical and numeric fields.<br>
That analyst forecasts often lean optimistic, highlighting the need for skepticism in financial predictions.<br>
How structured documentation (like this README) improves project clarity and collaboration.<br>
