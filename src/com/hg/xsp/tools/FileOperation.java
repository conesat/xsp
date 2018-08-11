package com.hg.xsp.tools;

import java.io.File;

public class FileOperation {

	
	/**
	 * 删除文件夹以及所有目录文件
	 * @param file
	 */
	public static void DeleteFolder(File file) {
		if (file.exists()) {
			if (file.isDirectory()) {
				File[] files = file.listFiles();
				for (File f : files) { // 遍历File[]数组
					DeleteFolder(f);
				}
			}
			file.delete();
		}
	}

}
