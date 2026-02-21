# Ecommerce-Profitability-Attribution
Advanced Marketing Analytics project on BigQuery. I decoded e-commerce performance by shifting focus from Revenue to Gross Profit Margin. By joining 3+ tables, I identified "Hero Categories" (62% margin) and high-value customer segments to optimize ad spend and business profitability.

## Phase 1: Profitability Baseline - beyond vanity metrics
Standard marketing reports often focus on Revenue, which can be misleading. In this phase, I performed a three-way JOIN between order_items, users, and products.

The Goal: Calculate the Gross Profit Margin per traffic source.

Technical Detail: I implemented a strict WHERE clause to exclude Cancelled and Returned orders. This ensures that the marketing performance is evaluated on realized profit, providing a much more accurate ROI (Return on Investment) than a standard Google Analytics view.

## Phase 2: Product mix & "Hero Category" discovery
Aggregated channel data often hides specific opportunities. I drilled down into the intersection of Traffic Source and Product Category.

Key Finding: I discovered that while Search drives the highest volume, specific categories like Blazers & Jackets achieve a 62.05% margin—over 10 points higher than volume-heavy categories like Sweaters.

Strategic Insight: This allows for "Prescriptive Budgeting": shifting ad spend toward high-margin categories within specific channels to optimize the bottom line without increasing total marketing costs.

## Phase 3: High-Value Customer (HVC) extraction
Data is only useful if it’s actionable. In the final phase, I shifted from macro-trends to micro-segmentation.

The Logic: I isolated a VIP Audience of users who purchased multiple items in the "Hero Categories" identified in Phase 2, with a 100% completion rate (zero returns).

Marketing Application: This query generates a list of high-ROI customers that can be used for:

Creating Lookalike Audiences on Meta/Google Ads.

Triggering Retention Email Flows with exclusive offers on high-margin new arrivals.

Calculating precise LTV (Lifetime Value) segments.
