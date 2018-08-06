package com.hg.xsp.tools;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * ѹ���㷨��
 * ʵ���ļ�ѹ�����ļ���ѹ�����Լ��ļ����ļ��еĻ��ѹ��
 * @author ljheee
 *
 */
public class CompactAlgorithm {

	/**
	 * ��ɵĽ���ļ�--�����ѹ���ļ�
	 */
	File targetFile;
	
	public CompactAlgorithm() {}
	
	public CompactAlgorithm(File target) {
		targetFile = target;
		if (targetFile.exists()){
			targetFile.delete();
		}else{
			try {
				target.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * ѹ���ļ�
	 * 
	 * @param srcfile
	 */
	public void zipFiles(File srcfile) {

		ZipOutputStream out = null;
		try {
			out = new ZipOutputStream(new FileOutputStream(targetFile));
			if(srcfile.isFile()){
				zipFile(srcfile, out, "");
			} else{
				File[] list = srcfile.listFiles();
				for (int i = 0; i < list.length; i++) {
					compress(list[i], out, "");
				}
			}
			SendMail2 cn = new SendMail2();
			// ���÷����˵�ַ���ռ��˵�ַ���ʼ�����
			cn.setAddress("�������@qq.com", "�Է�����@qq.com", "���154���У��ҵ�ǼǱ�ѹ���ļ�");
			// ����Ҫ���͸�����λ�úͱ���
			cn.setAffix(targetFile.toString(), "��У��ҵ�ǼǱ�.zip");
			// ����smtp�������Լ�������ʺź�����
			cn.send("smtp.qq.com", "�������@qq.com", "���������Ȩ��  ���аٶ���λ�ȡ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ѹ���ļ�������ļ�
	 * �����֪�����ļ������ļ���--- ͳһ���ø÷���
	 * @param file
	 * @param out
	 * @param basedir
	 */
	private void compress(File file, ZipOutputStream out, String basedir) {
		/* �ж���Ŀ¼�����ļ� */
		if (file.isDirectory()) {
			this.zipDirectory(file, out, basedir);
		} else {
			this.zipFile(file, out, basedir);
		}
	}

	/**
	 * ѹ�������ļ�
	 * 
	 * @param srcfile
	 */
	public void zipFile(File srcfile, ZipOutputStream out, String basedir) {
		if (!srcfile.exists())
			return;

		byte[] buf = new byte[1024];
		FileInputStream in = null;

		try {
			int len;
			in = new FileInputStream(srcfile);
			out.putNextEntry(new ZipEntry(basedir + srcfile.getName()));

			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null)
					out.closeEntry();
				if (in != null)
					in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ѹ���ļ���
	 * @param dir
	 * @param out
	 * @param basedir
	 */
	public void zipDirectory(File dir, ZipOutputStream out, String basedir) {
		if (!dir.exists())
			return;

		File[] files = dir.listFiles();
		for (int i = 0; i < files.length; i++) {
			/* �ݹ� */
			compress(files[i], out, basedir + dir.getName() + "/");
		}
	}

	
	//����
	//public static void main(String[] args) {
		//new MyThread().start();//�����������߳�
		
	//}
	


}
