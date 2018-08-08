package com.hg.xsp.tools;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.NameList;
import com.hg.xsp.entity.Task;

public class XmlTool {
	private static String PATH = "D:\\xsp\\user\\";

	/**
	 * DOM方式创建xml文件
	 * 
	 * @param file
	 *            文件
	 * @throws Exception
	 */
	public static void taskXmlCreate(File file, String ele_root) throws Exception {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document document = db.newDocument();
		document.setXmlStandalone(true);
		Element root = document.createElement(ele_root);
		document.appendChild(root);
		TransformerFactory tff = TransformerFactory.newInstance();
		Transformer tf = tff.newTransformer();
		tf.setOutputProperty(OutputKeys.INDENT, "yes");
		tf.transform(new DOMSource(document), new StreamResult(file));

	}

	public static List<Task> getTasks(String mail) {
		List<Task> tasks = new ArrayList<>();
		/*
		 * 创建文件工厂实例
		 */
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		// 如果创建的解析器在解析XML文档时必须删除元素内容中的空格，则为true，否则为false
		dbf.setIgnoringElementContentWhitespace(true);
		try {
			/*
			 * 创建文件对象
			 */
			DocumentBuilder db = dbf.newDocumentBuilder();// 创建解析器，解析XML文档
			Document doc = db.parse(PATH + mail + "\\task\\tasks.xml"); // 使用dom解析xml文件
			/*
			 * 历遍列表，进行XML文件的数据提取
			 */
			// 根据节点名称来获取所有相关的节点
			NodeList sonlist = doc.getElementsByTagName("task");
			for (int i = 0; i < sonlist.getLength(); i++) // 循环处理对象
			{
				Task task = new Task();
				// 节点属性的处理
				Element son = (Element) sonlist.item(i);
				// 循环节点son内的所有子节点
				for (Node node = son.getFirstChild(); node != null; node = node.getNextSibling()) {
					// 判断是否为元素节点
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						String name = node.getNodeName();
						String value = node.getFirstChild().getNodeValue();
						switch (name) {
						case "title":
							task.setTitle(value);
							break;
						case "content":
							task.setContent(value);
							break;
						case "begin":
							task.setBegin(value);
							break;
						case "end":
							task.setEnd(value);
							break;
						case "state":
							task.setState(value);
							break;
						case "nameListName":
							task.setNameListName(value);
							break;
						case "fileName":
							task.setFileName(value);
							break;
						}
					}
				}
				tasks.add(task);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tasks;
	}

	// 新增节点
	public static void addTask(String mail, Task task) {
		// 创建文件工厂实例
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(false);
		try {

			DocumentBuilder db = dbf.newDocumentBuilder();
			// 创建Document对象
			Document xmldoc = db.parse(PATH + mail + "\\task\\tasks.xml");
			// 获取根节点
			Element root = xmldoc.getDocumentElement();

			Element taskNode = xmldoc.createElement("task");
			taskNode.setAttribute("id", task.getId());

			Element title = xmldoc.createElement("title");
			title.setTextContent(task.getTitle());
			taskNode.appendChild(title);

			Element content = xmldoc.createElement("content");
			content.setTextContent(task.getContent());
			taskNode.appendChild(content);

			Element begin = xmldoc.createElement("begin");
			begin.setTextContent(task.getBegin());
			taskNode.appendChild(begin);

			Element end = xmldoc.createElement("end");
			end.setTextContent(task.getEnd());
			taskNode.appendChild(end);

			Element state = xmldoc.createElement("state");
			state.setTextContent("收集中");
			taskNode.appendChild(state);
			// 把son添加到根节点中
			root.appendChild(taskNode);
			// 保存
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer former = factory.newTransformer();
			former.transform(new DOMSource(xmldoc), new StreamResult(new File(PATH + mail + "\\task\\tasks.xml")));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 新增收集群组
	public static void addName(String mail, String filename, NameList nameList) throws Exception {
		// 创建文件工厂实例
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(false);
		DocumentBuilder db = dbf.newDocumentBuilder();
		// 创建Document对象
		Document xmldoc = db.parse(PATH + mail + "\\namelist\\" + filename + ".xml");
		// 获取根节点
		Element root = xmldoc.getDocumentElement();
		for (int i = 0; i < nameList.getNames().size(); i++) {
			Element taskNode = xmldoc.createElement("user");
			Element id = xmldoc.createElement("id");
			id.setTextContent(nameList.getNames().get(i).getId());
			taskNode.appendChild(id);
			Element name = xmldoc.createElement("name");
			name.setTextContent(nameList.getNames().get(i).getName());
			taskNode.appendChild(name);
			root.appendChild(taskNode);
		}
		// 保存
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer former = factory.newTransformer();
		former.transform(new DOMSource(xmldoc),
				new StreamResult(new File(PATH + mail + "\\namelist\\" + filename + ".xml")));
	}

	public static List<Name> getNameList(String mail, String filename) {
		List<Name> names = new ArrayList<>();
		/*
		 * 创建文件工厂实例
		 */
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		// 如果创建的解析器在解析XML文档时必须删除元素内容中的空格，则为true，否则为false
		dbf.setIgnoringElementContentWhitespace(true);
		try {
			/*
			 * 创建文件对象
			 */
			DocumentBuilder db = dbf.newDocumentBuilder();// 创建解析器，解析XML文档
			Document doc = db.parse(PATH + mail + "\\namelist\\" + filename + ".xml"); // 使用dom解析xml文件
			/*
			 * 历遍列表，进行XML文件的数据提取
			 */
			// 根据节点名称来获取所有相关的节点
			NodeList sonlist = doc.getElementsByTagName("user");
			for (int i = 0; i < sonlist.getLength(); i++) // 循环处理对象
			{
				Name myname = new Name();
				// 节点属性的处理
				Element son = (Element) sonlist.item(i);
				// 循环节点son内的所有子节点
				for (Node node = son.getFirstChild(); node != null; node = node.getNextSibling()) {
					// 判断是否为元素节点
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						String name = node.getNodeName();
						String value = node.getFirstChild().getNodeValue();
						switch (name) {
						case "id":
							myname.setId(value);
							break;
						case "name":
							myname.setName(value);
							break;
						}
					}
				}
				names.add(myname);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return names;
	}

}
