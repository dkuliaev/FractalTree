private double fractionLength = .78; 
private int smallestBranch = 3; 
private double branchAngle = .1;  
private int branchThickness = 1;


public void setup() 
{   
	size(640,480);    
	noLoop();
} 
public void draw() 
{   
	background(102, 178, 255);   
	stroke(0, 100, 0);   
	strokeWeight(8);
	line(320, 480, 320, 380);
	drawBranches(320, 380, 100, 3*Math.PI/2, 8);
} 
public void drawBranches(int x,int y, double branchLength, double angle, int thickness) 
{   
	double angle1 = angle - branchAngle+(Math.random()-0.5);
	double angle2 = angle + branchAngle+(Math.random()-0.5);
	branchLength = branchLength * fractionLength; 
	thickness = thickness - branchThickness;
	if(thickness <= 1)
	{
		thickness = 1;
	}
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	
	strokeWeight(thickness);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength >= smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1, thickness);
		drawBranches(endX2, endY2, branchLength, angle2, thickness);
	}
	
} 
