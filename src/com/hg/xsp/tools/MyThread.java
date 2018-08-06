package com.hg.xsp.tools;

import java.io.File;

public class MyThread extends Thread{
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		/*try {
			String time="2018-07-19 21:00:00";
			boolean finish=false;
			while (!finish) {
				if (Datetool.getMinOfDateToDate(time)>0) {
					finish=true;
					File f = new File("/root/�ĵ�/bgfile/tj");
					new CompactAlgorithm(new File( "/root/�ĵ�/bgfile",f.getName()+".zip")).zipFiles(f);
					break;
				}else {
					this.sleep(10000);
				}
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
