# News App

## Instructions

Design a simple news app that aggregates articles from an API and allows users to engage with the content.

The API you will be using is the https://newsapi.org/. The API key is provided in the project.

## Requirements

1. Display a list of news articles, each showing an image and title. Tapping an article should open the url.
2. Allow users to like and unlike articles by tapping a "like" button. Likes should be stored locally and persist across app restarts.
3. Implement infinite scrolling: when users reach the bottom of the list, more articles should load automatically.

## Non-functional Requirements

1. The design should allow for handling large amounts of news articles efficiently.
2. The app should gracefully handle network failures and allow users to see previously fetched articles.
