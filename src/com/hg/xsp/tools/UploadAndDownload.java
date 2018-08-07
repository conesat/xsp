package com.hg.xsp.tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;

/**
 * 上传和下载类
 * 
 * @author JTXY
 *
 */
public class UploadAndDownload {

	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	public boolean upload(HttpServletRequest request, HttpServletResponse response, String file,String id_card)
			throws ServletException, IOException {

		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 如果不是则停止
			PrintWriter writer = response.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();
			return false;
		}
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// 中文处理
		upload.setHeaderEncoding("UTF-8");

		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录

		String uploadPath = file;

		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// 解析请求的内容提取文件数据
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					// 处理不在表单中的字段
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						// 添加时间
						String fName = "";
						String suffix = "";
						if (fileName.indexOf(".") >= 0) {

							int indexdot = fileName.indexOf(".");
							suffix = fileName.substring(indexdot);

							fName = fileName.substring(0, fileName.lastIndexOf("."));
							Date now = new Date();
							fName = "_"+now.getTime();
							fName =id_card+ fName + suffix;
						}

						String filePath = uploadPath + File.separator + fName;
						File storeFile = new File(filePath);
						//System.out.println(fileName);
						// 在控制台输出文件的上传路径
						System.out.println(filePath);
						// 保存文件到硬盘
						item.write(storeFile);
						request.setAttribute("message", "文件上传成功!");
					}
				}
			}
		} catch (Exception ex) {
			request.setAttribute("message", "错误信息: " + ex.getMessage());
			return false;
		}

		return true;
	}
}
