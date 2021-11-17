# Simulation-of-associative-memory-networks
Dissertation of my additional one year Master in Artificial Intelligence at the KULeuven, Belgium.

Many thanks to my promotor  Prof Doctor D. Bollé at the Institute of theoretical physics, KULeuven and his team!

By associative memory networks we mean artificial neural networks in which information can be stored in a distributed manner, in contrast to classical memory systems where pointers to memory locations are used.
The operation of this process is illustrated in the figure below. 

![image](https://user-images.githubusercontent.com/22667944/142162663-749ed32c-0354-44b5-9399-d249f5ad5fbe.png)


A Hopfield network of binary neurons was trained to remember, among other things, a photo of Einstein (85 x 85 pixels). When one wants to evoke this image, one only has to show a partial or a vague version of it to the network, which then further completes this 'guess' to the stored pattern that best corresponds to the displayed version. The figure also shows the intermediate states during the recall process.
## Goals
The motivation of this project was the development of a kind of toolbox that allows an elegant implementation of new models, so that these models can be investigated in an effective and efficient way.
High performance, both in terms of memory consumption and speed, is necessary as the simulation results serve as a supplement to the theoretical calculations for infinitely large networks.
Characteristics to be checked include; the maximum number of patterns that can be stored, the basin of attraction for stored patterns, the phase diagram, the phase portrait and the occurrence of so-called mixture states, contour recovery and inverse states.
In a first phase, simulations had to be performed for the Hopfield model. In a second phase, an extension to more recent architectures had to be done.
## Methodology
To achieve the necessary combination of efficiency with flexibility, object oriented code was developed in C++.
Visually meaningful information was presented using the Simple DirectMedia Layer, so that bitmaps could be written. This was essential to study phenomena such as mixture states, contour recovery and inverse states.
The program code was validated by simulating points in the phase diagram for which theoretical solutions are available.
## Results
The intended objectives were all achieved. In addition, a user-friendly interface was realized in which the Hopfield, the Q-Ising and the Blume-Emery-Griffiths (BEG) models were implemented. It is hereby possible to examine the effects of certain model parameters in a graphical environment by generating phase portraits and other relevant graphs. Thus, the qualitative difference between the capacity of the Q-Ising and the BEG model was demonstrated. Experimental evidence was also found for the fact that spin glass states are more stable than the target patterns when the network is in a certain phase.
The existence of mixture states, contour recovery and inverse states was demonstrated through visualized simulations, as can be seen in the figure opposite (A-D are the stored patterns).

![image](https://user-images.githubusercontent.com/22667944/142162768-0c211e3c-c0b7-4be8-bc30-e4491b7f3e87.png)

For the first time, it was quantitatively demonstrated that the basin of attraction is much larger for the BEG model compared to the Q-Ising model.
