//
//  data.swift
//  Storyboard
//
//  Created by Alec Schneider on 02.04.17.
//  Copyright © 2017 Alec Schneider. All rights reserved.
//

import Foundation

public let projects: [String: [String: String]] = [
    "emotechatbot": [
        "image": "chatbotPreview.JPG",
        "title": "@EmoteChatBot",
        "description": "This is a bot you can use in the messenger Telegram. I builded this bot for me and my friends but later decided to release it. It has over 2k unique user a month and around 300 users a day and growing. Its idea is pretty basic you can use any text phrase to connect to any media you want. So every time someone write the text phrase in the chat the bot will post what ever you connected it to, like a photo, gif or sticker. In this example I connected the WWDC 2017 Photo with the phrase \"Apple\".",
    ],
    "home": [
        "image": "homePreview.JPG",
        "title": "Home Automation",
        "description": "Making my room smarter by building on top of Apple’s HomeKit and automating stuff like LED lights, temperature and humidity sensors, power outlets, a fan and infrared controlled devices using Arduino boards. All the home functionalities displayed in this playground and even more are working exactly like this in my dorm room. In this picture you see the arduino board and the circuit that make the temperature and humidity sensor as well as the led lights behind the desk work.",
    ],
    "soccer": [
        "image": "soccerPreview.JPG",
        "title": "Utilizing Neural Networks to Detect Compound Events in Spatio-Temporal Soccer Data",
        "description": "Working with SAP, we are using Neural Networks to classify events in soccer matches, that are currently still detected by humans. So far we can classify “ball in play or not” and event detection like kicks, receptions, clearance, dribbling. \n\nTechnologies used: SAP HANA, Python, scikit-learn, Angular 2",
    ],
    "bachelor": [
        "image": "bachelorPreview.JPG",
        "title": "Data Ingestion And -Analysis for Semantic Enterprise Networks",
        "description": "My ongoing bachelor project with Commerzbank’s risk management department. Building a graph to analyze networks between more than 800,000 companies with the goal of finding correlations and estimating the solvency of a company. \n\nTechnologies used: Spark, Scala, Cassandra, Neo4j, React",
    ],
]
