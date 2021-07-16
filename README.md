# Flutter weekly chart

The Flutter app demonstrates displaying data in a weekly format. I came across this kind of screen in the app that I have been working on called `Ergonomic Productivity Timer` and I want to share the code of the weekly chart screen. If you find this helpful don't forget to leave a star at the repository.

`Ergonomic Productivity Timer` is productivity timer that care for health! 

Get it on Google Play Store and App Store today!

[Google Play Store](https://bit.ly/3pZOuEE)

[App Store](https://apps.apple.com/th/app/ergonomic-pomodoro-timer/id1550788893s)


## How it look like? 
![Simulator Screen Recording - iPhone 12 Pro Max - 2021-07-16 at 21 27 53](https://user-images.githubusercontent.com/19642082/125965234-1b850dd1-12ed-4bd7-8280-e334a424dfc6.gif)

## What do the data mean?

<img src="https://user-images.githubusercontent.com/19642082/125965891-076230b1-9318-4ad3-810b-5440765ad416.png">

Each day in the week, the height of the chart is propotional to the fraction of `each day data` divided by `the max value of the week`. In this case, the max value of the week is on Friday.

## Change current week

In this example, we only display the current and the previous weeks. We also hilight today date on current week. Suppose today is Friday, July 16th. Current week is 12 Jul - 18 Jul starting from Monday to Sunday. 

Current week state

<img src="https://user-images.githubusercontent.com/19642082/125968127-1de2cbd9-a89b-4592-be72-777c3ee80474.png">

Previous week state

<img src="https://user-images.githubusercontent.com/19642082/125965804-31a7a49c-ac50-444d-a6e9-0a7a433c5549.png">

## Library
This app use [GetX](https://pub.dev/packages/get) as state management library.

