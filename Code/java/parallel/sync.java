
class Pattern
{

	public synchronized void DisplayA()             // Statement 1
	{
		for(int i=1;i<=50;i++)
			System.out.print("A");
	}

	public synchronized void DisplayB()             // Statement 2
	{
		for(int i=1;i<=50;i++)
			System.out.print("B");
	}

	public void DisplayC()
	{
		synchronized(this)                                      // Statement 3
		{
			for(int i=1;i<=50;i++)
				System.out.print("C");
		}
	}
}

class ThreadA implements Runnable
{
	Pattern P;

	ThreadA(Pattern P)
	{
		this.P = P;
	}

	public void run()
	{
		P.DisplayA();
	}
}

class ThreadB implements Runnable
{

	Pattern P;

	ThreadB(Pattern P)
	{
		this.P = P;
	}

	public void run()
	{
		P.DisplayB();
	}
}

class ThreadC implements Runnable
{

	Pattern P;

	ThreadC(Pattern P)
	{
		this.P = P;
	}

	public void run()
	{
		P.DisplayC();
	}
}

class sync
{
	public static void main(String arg[])
	{

		Pattern P = new Pattern();

		ThreadA A = new ThreadA(P);
		ThreadB B = new ThreadB(P);
		ThreadC C = new ThreadC(P);


		Thread t1 = new Thread(A);
		Thread t2 = new Thread(B);
		Thread t3 = new Thread(C);

		t1.start();
		t2.start();
		t3.start();

	}
}
