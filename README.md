# DE1-Project-Smart-Parking-System-with-Ultrasonic-Sensors
Design and implement a smart parking system using VHDL on the Nexys A7 FPGA board. The system will utilize multiple ultrasonic sensors (HS-SR04) connected to the Pmod connectors for detecting the presence and distance of vehicles within parking spaces. Develop algorithms to analyze sensor data and determine parking space availability. Visualize parking space occupancy status using LEDs, while displaying distance measurements on the 7-segment display.

# Team members
## Oldřich Hána (responsible for ...)
## Jan Chládek (responsible for ...)
## Marek Hlavatovič (responsible for ...)
## Tomáš Čišecký (responsible for ...)
### Theoretical description and explanation

A smart parking system is an automated system designed to optimize the management and control of parking spaces. Its main objective is to improve the efficiency of parking space utilization and provide convenient parking services for drivers. It operates based on sensors placed on parking spaces, which monitor the presence of vehicles and determine their distance from the sensor. These sensors can be ultrasonic sensors like the HS-SR04. 

Smart parking system is beneficial for urban areas, shopping centers, airports, hospitals, and other places with high vehicle traffic.

**Advantages:**
- space utilization optimization
- enhanced convenience
- reduction in traffic issues
- Increased security

**Disadvantages:**
- implementation costs
- maintenance and updates
- technology dependency

In our solution, we implemented the management of the ultrasonic sensor using Moore's finite state machine. We use a 7-segment display to display the distance.

### Hardware description of demo application
Insert descriptive text and schematic(s) of your implementation.

### Software description
Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in src and sim folders.

### Component(s) simulation
Write descriptive text and put simulation screenshots of your components.

### Instructions
Write an instruction manual for your application, including photos and a link to a short app video.

### References
[Nexys A7 manual](https://digilent.com/reference/_media/reference/programmable-logic/nexys-a7/nexys-a7_rm.pdf)

[HC-SR04 User Manual](https://web.eece.maine.edu/~zhu/book/lab/HC-SR04%20User%20Manual.pdf)
