int numTri;

public void setup()
{
	size(500, 500);
	background(0);
	numTri = 400;
}
public void draw()
{
	background(0);
	sierpinski(50, 450, 400);
}
public void mouseDragged() //optional
{
}
public void mousePressed()
{	
	numTri/=2;
	if (numTri == 0)
	{
		numTri = 400;
	}
	
	System.out.println(numTri);
}
public void sierpinski(int x, int y, int len) 
{
	if (len > numTri)
	{
		sierpinski(x, y, len/2);
		sierpinski(x+len/2, y, len/2);
		sierpinski(x+len/4, y-len/2, len/2);
	}
	else
	{
		stroke(255);
		strokeWeight(1);
		triangle(x, y, x+len, y, x+len/2, y-len);
	}
}