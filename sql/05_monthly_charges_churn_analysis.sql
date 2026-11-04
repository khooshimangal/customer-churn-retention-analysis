USE customer_churn_analysis;

SELECT 
    CASE
        WHEN MonthlyCharges < 35 THEN 'Below $35'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN '$35 - $70'
        WHEN MonthlyCharges > 70 THEN 'Above $70'
    END AS Monthly_Charges_Category,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS Churn_Rate_Percentage
FROM 
    telco_customer_churn
GROUP BY 
    CASE
		WHEN MonthlyCharges < 35 THEN 'Below $35'
		WHEN MonthlyCharges BETWEEN 35 AND 70 THEN '$35 - $70'
        WHEN MonthlyCharges > 70 THEN 'Above $70'
    END
ORDER BY 
    Churn_Rate_Percentage DESC;
    
