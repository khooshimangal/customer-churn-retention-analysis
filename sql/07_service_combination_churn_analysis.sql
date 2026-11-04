USE customer_churn_analysis;
SELECT 
    OnlineSecurity,
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS Churn_Rate_Percentage
FROM 
    telco_customer_churn
WHERE
	InternetService <> "No"
GROUP BY
	OnlineSecurity,
    TechSupport
ORDER BY 
    Churn_Rate_Percentage DESC;
