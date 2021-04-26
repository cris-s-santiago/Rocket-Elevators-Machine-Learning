# Week 13: Artificial Intelligence and Machine Learning #
         Tommy Cote
         Claude St-Laurent
         Cristiane Santiago
         Ines Josiane Izere
         Felix Masse
         Eric Turcotte
At Rocket Elevators Machine Learning is a tool that will give products a competitive edge if the necessary functionality is implemented correctly. Rocket Elevators are highly secure places because what happens during operations can be embarrassing for customers. It is therefore worthwhile to offer those who operate our products safety features that ensure the safety of the users:
## Audio Processing ##
1.	To recognize passengers via voice profiles
2.	Transcribe audio for legal purposes

To acces those functionalities, first you have to access the admin section with the **user => admin@admin** and the **password 123456**.
After you can access it via the admin tab in the header:
1.  Via **Speaker Id** for point #1
2.  Via **Speech To Text** for point #2
## Speaker identification
1. Registration
2. Aknowledgement
***
#### The files used for the enrollments are in this folder:<br>
* app\assets\sounds\Enrollment<br>

#### The files used for the scenarios are in this folder:<br>
* app\assets\sounds<br>
***
All the _**keys**_ needed for the methods and the _**infos**_ about the profile Ids are in the API.txt file in the app\assets\sounds folder.

# Transcript of conversations
## How we did It ##
- Our goal was to use Azure Congnitive Services.
![](app\assets\images\readMe\azurespeech.png)
[Azure Cognitive Service](https://docs.microsoft.com/en-us/azure/cognitive-services/)
## First ##
We start by activating the API in Azure
![](app\assets\images\readMe\API.png)
Giving us the Keys we needed to start using the API.
![](app\assets\images\readMe\speech.png)
For our project, we needed to Start with: [Speech-to-text](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started-speech-to-text?tabs=windowsinstall&pivots=programming-language-csharp) from the Azure documentations, and we choose C#
After going trough the tutorial, this is what we got:
![](app\assets\images\readMe\MachineLearning.png)
This will be explained in the video.
It should be known that it wasn't totaly effective as it could be since it is difficult to implement it flawlessly.
![](app\assets\images\readMe\scenarioex.png)
We did get the recording from the API to work.
![](app\assets\images\readMe\record.png)
And the recording. But it wasn't to our liking.
We wish we could have made it work with just one click, but it wasn't meant to be... this time.