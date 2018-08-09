package com.hg.xsp.staticvalues;

public class StaticValues {
	public static int cj = 0;
	public static float cjtime = 0f;
	public static boolean cjstate = false;
	//public static String HOME_PATH="D:\\xsp\\user\\";
	public static String HOME_PATH="/root/文档/xsp/user/";//linux
	
	public StaticValues() {
		new Runnable() {
			public void run() {
				try {
					Thread.sleep(120000);
					cj = 0;
					cjtime = 0f;
					cjstate = false;
					System.out.println(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		};
	}

}
