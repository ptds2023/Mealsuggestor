

# Meal Suggestor


![](man/figures/meal.jpg)


## Overview

Welcome to the `Meal Suggestor` package! This R package is designed to make meal planning easier and more enjoyable. Utilizing a comprehensive dataset of diverse recipes, our package offers tailored meal suggestions based on user preferences such as cuisine type, dietary restrictions, and preparation time. Whether you are a cooking enthusiast or just looking for daily meal inspiration, our package is here to help you explore a world of culinary possibilities.

## Data Description and Preparation

We Found the dataset from Kaggle, whcih contains more than 8000 food recipes with cuisines from across the globe (with major focus on Indian Dishes). In this dataset, we can get the information about the food recipes, approximate cooking and preparation times, cooking instructions,ingredients used, Recipe Author and Ratings.

Then, to enhance the readability and analyzability of the dataset, preprocessing was performed. Initially, unnecessary columns were removed. Subsequently, certain columns underwent format conversion.

## Features

- **Cuisine Filter**: Find meals from specific cuisines like Mexican, Italian, Indian, and more.
- **Dietary Considerations**: Filter recipes based on dietary needs such as vegetarian, vegan, or gluten-free options.
- **Preparation and Cooking Time**: Choose recipes based on the time you have available, from quick snacks to elaborate dinners.
- **Ingredient-based Suggestions**: Get recommendations based on ingredients you already have at home.

## Getting Started

### Installation

To install the Meal Suggestion package, use the following command in R:

```r
# install.packages("devtools")
devtools::install_github("ptds2023/Mealsuggestor")
```

# Functions

`Meal Suggestor` offers a variety of functions to different needs and preferences in meal planning:

- `filter_by_time()`

Use `filter_by_time()` to find recipes matching your available cooking and preparation time.

- `get_recipes()`

Discover recipes based on a combination of criteria with `get_recipes()`.


- `get_top_n_recipes()`

Retrieve the top-rated recipes using `get_top_n_recipes()`.

- `random_recipe()`

Let `random_recipe()` surprise you with a random meal suggestion.


- `sort_recipes()`

Organize your recipe search results with `sort_recipes()` based on criteria like preparation time or rating.



# Integrated Shiny App for Interactive Meal Planning

**Meal Suggestor** also includes an interactive Shiny app, enhancing your meal planning experience. Launch it from your R console and input your preferences to receive meal suggestions:

```r
# Launch the Shiny app for interactive meal planning
launchMealApp()
```

# Website 

Here is our [website](https://ptds2023.github.io/Mealsuggestor/)


# Contributing

Your contributions can help make Meal Suggestor even better! If you have ideas for new features, enhancements, or find any bugs, please visit our [GitHub repository](https://github.com/ptds2023/Mealsuggestor) to contribute or report issues. 



