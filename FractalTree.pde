private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle1 = 3;
private double branchAngle2 = 3; 

public void setup() 
{   
	size(1200,480);    
	
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(300,480,300,380);   
	drawBranches(300,380,100,3*Math.PI/2, branchAngle1); 
	line(900,480,900,380);   
	drawBranches(900,380,100,3*Math.PI/2,branchAngle2); 
}

public void mouseWheel(MouseEvent event)
{
	float e = event.getCount();
	if(e > 0)
	{
		if(mouseX < 600 && branchAngle1 < 3){branchAngle1 += 0.015;}
		else if(mouseX > 600 && branchAngle2 < 3){branchAngle2 += 0.015;}
	}
	if(e < 0)
	{
		if(mouseX < 600 && branchAngle1 > .35){branchAngle1 -= 0.015;}
		else if(mouseX > 600 && branchAngle2 > .35){branchAngle2 -= 0.015;}
	}
}


public void drawBranches(int x,int y, double branchLength, double angle, double branchAngle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	if(branchLength > smallestBranch)
	{
		line(x,y,endX1, endY1);
		line(x,y,endX2, endY2);
		drawBranches(endX1,endY1,branchLength,angle1, branchAngle);
		drawBranches(endX2,endY2,branchLength,angle2, branchAngle);
	}
	else
	{
		line(x,y,endX1, endY1);
		line(x,y,endX2, endY2);
		
	}
	

} 
