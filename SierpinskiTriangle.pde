int numTri;
int triColor;
int length;
int xPos, yPos;

public void setup()
{
	size(800, 800);
	background(0);
	numTri = 400;
	triColor = color(32, 240, 177);
	length = 400;
	xPos = 100;
	yPos = 450;
}
public void draw()
{
	background(0);
	sierpinski(xPos, yPos, length);
}
public void mouseDragged() //optional
{
	xPos += (mouseX - pmouseX);
	yPos += (mouseY - pmouseY);
}
public void keyPressed()
{
	if (keyCode == DOWN)
	{
		if(length <= 70 || numTri <= 20)
		{
			length = 400;
			numTri = 400;
		}
		numTri/=2;
		length-=50;
		triColor = color((int)(Math.random()*10)+30, (int)(Math.random()*120)+96, (int)(Math.random()*100)+78);
	}
	if (keyCode == UP)
	{
		if(length >= 1200 || numTri <= 20)
		{
			length = 400;
			numTri = 400;
		}
		numTri/=2;
		length+=50;
		triColor = color((int)(Math.random()*10)+30, (int)(Math.random()*120)+96, (int)(Math.random()*100)+78);
	}
}
public void sierpinski(int x, int y, int len) 
{
	if (len <= /*>*/ numTri)
	{
		stroke(triColor);
		fill(triColor);
		strokeWeight(1);
		triangle(x, y, x+len, y, x+len/2, y-len);
		/*sierpinski(x, y, len/2);
		sierpinski(x+len/2, y, len/2);
		sierpinski(x+len/4, y-len/2, len/2);*/   //accidentally flipped the base case o_o"
	}
	else
	{
		/*stroke(triColor);
		fill(triColor);
		strokeWeight(1);
		triangle(x, y, x+len, y, x+len/2, y-len);*/
		sierpinski(x, y, len/2);
		sierpinski(x+len/2, y, len/2);
		sierpinski(x+len/4, y-len/2, len/2);
	}
}