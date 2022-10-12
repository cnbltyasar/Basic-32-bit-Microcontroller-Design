<h1> Basic 32 bit Microcontroller Design <h1>
  
### Implementing a datapath to execute Arithmetic (R-type) operations

### Designed Block Diagrams
  
![image](https://user-images.githubusercontent.com/92871230/195410121-74fe8f0c-60a0-464b-b79f-d4082651b007.png)

### Below is the Datapath that we will use. We will start with understanding how we can configure the Control signals based on any given instruction.
  
![image](https://user-images.githubusercontent.com/92871230/195406721-cc7712fa-a06f-4947-afe8-005fdfe420ee.png)
  
 
### ALU Operations Table listed with ALU control values. 
  
| Operations   | ALUControl value | Description && Notes |
| ------------- | ------------- |------------- | 
| ADDITION  | 0000  | ALUResult = A + B | 
| SUBRACTION  | 0001  | ALUResult = A - B | 
| MULTIPLICATION  | 0010  | ALUResult = A * B | 
| AND  | 0011  | A and B | 
| OR  | 0100  | A or B | 
| SET LESS THAN  | 0101 | ALUResult =(A < B)? 1:0 | 
| SET EQUAL  | 0110 | ALUResult =(A=B) ? 1:0 |
| SET NOT EQUAL  | 0111 | ALUResult =(A!=B) ? 1:0 | 
| LEFT SHIFT  | 1000 | ALUResult = A << B |
|RIGHT SHIFT | 1001 | ALUResult = A >> B  |                                     
| ROTATE RIGHT  | 1010  | ALUResult = A ROTR B | 
  
 
