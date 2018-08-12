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
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.NameList;
import com.hg.xsp.entity.Task;
import com.hg.xsp.staticvalues.StaticValues;

public class XmlTool {

	/**
	 * DOM方式创建xml文件
	 * 
	 * @param file 文件
	 * @throws Exception
	 */
	public static void createXml(File file, String ele_root) throws Exception {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document document = db.newDocument();
		document.setXmlStandalone(true);
		Element root = document.createElement(ele_root);
		root.setTextContent(" ");
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
			File file = new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml");
			if (!file.exists()) {
				new File(StaticValues.HOME_PATH + mail + "/task").mkdirs();
				createXml(file, "tasks");
			}

			Document doc = db.parse(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml")); // 使用dom解析xml文件

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
				task.setId(son.getAttribute("id"));
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
							long time = Datetool.getMinOfDateToDate(task.getEnd());
							if (value.equals("收集中") && time > 0) {
								task.setState("已过期");
							} else {
								task.setState(value);
							}
							break;
						case "nameListName":
							task.setNameListName(value);
							break;
						}
					}
				}
				tasks.add(task);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			Document xmldoc = db.parse(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml"));
			// 获取根节点
			Element root = xmldoc.getDocumentElement();

			Element taskNode = xmldoc.createElement("task");
			taskNode.setAttribute("id", task.getId());
			Element title = xmldoc.createElement("title");
			if (task.getTitle().equals("")) {
				title.setTextContent(" ");
			} else {
				title.setTextContent(task.getTitle());
			}

			taskNode.appendChild(title);

			Element content = xmldoc.createElement("content");
			if (task.getContent().equals("")) {
				content.setTextContent(" ");
			} else {
				content.setTextContent(task.getContent());
			}
			taskNode.appendChild(content);

			Element begin = xmldoc.createElement("begin");
			if (task.getBegin().equals("")) {
				begin.setTextContent(" ");
			} else {
				begin.setTextContent(task.getBegin());
			}
			taskNode.appendChild(begin);

			Element end = xmldoc.createElement("end");
			if (task.getEnd().equals("")) {
				end.setTextContent(" ");
			} else {
				end.setTextContent(task.getEnd());
			}
			taskNode.appendChild(end);

			Element state = xmldoc.createElement("state");
			state.setTextContent("收集中");
			taskNode.appendChild(state);
			// 把son添加到根节点中
			root.appendChild(taskNode);
			// 保存
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer former = factory.newTransformer();
			former.transform(new DOMSource(xmldoc),
					new StreamResult(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml")));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除节点
	 * 
	 * @param mail 邮箱
	 * @param id   收集id
	 */
	public static void delNode(String mail, String id) {

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);

		try {

			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xmldoc = db.parse(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml"));
			// 获取根节点
			Element root = xmldoc.getDocumentElement();
			Element son = (Element) selectSingleNode("/tasks/task[@id='" + id + "']", root);
			// 删除该节点
			root.removeChild(son);
			// 保存
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer former = factory.newTransformer();
			former.transform(new DOMSource(xmldoc),
					new StreamResult(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml")));

		} catch (Exception e) {
		}

	}

	/**
	 * 删除节点
	 * 
	 * @param mail 邮箱
	 * @param id   收集id
	 */
	public static Task getTaskById(String mail, String id) {
		Task task = new Task();
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xmldoc = db.parse(new File(StaticValues.HOME_PATH + mail + "/task/tasks.xml"));
			// 获取根节点
			Element root = xmldoc.getDocumentElement();
			Element son = (Element) selectSingleNode("/tasks/task[@id='" + id + "']", root);

			task.setId(son.getAttribute("id"));
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
						long time = Datetool.getMinOfDateToDate(task.getEnd());
						if (value.equals("收集中") && time > 0) {
							task.setState("已过期");
						} else {
							task.setState(value);
						}
						break;
					case "nameListName":
						task.setNameListName(value);
						break;
					}

				}
			}
		} catch (Exception e) {
		}
		return task;

	}

	// 修改节点信息
	public static Node selectSingleNode(String express, Element source) {
		Node result = null;
		// 创建XPath工厂
		XPathFactory xpathFactory = XPathFactory.newInstance();
		// 创建XPath对象
		XPath xpath = xpathFactory.newXPath();
		try {
			result = (Node) xpath.evaluate(express, source, XPathConstants.NODE);
		} catch (XPathExpressionException e) {
		}
		return result;
	}

	// 新增收集群组
	public static void addName(String mail, String filename, NameList nameList) throws Exception {
		// 创建文件工厂实例
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(false);
		DocumentBuilder db = dbf.newDocumentBuilder();
		// 创建Document对象
		Document xmldoc = db.parse(new File(StaticValues.HOME_PATH + mail + "/namelist/" + filename + ".xml"));
		// 获取根节点
		Element root = xmldoc.getDocumentElement();
		for (int i = 0; i < nameList.getNames().size(); i++) {
			Element taskNode = xmldoc.createElement("user");
			Element id = xmldoc.createElement("id");
			if (nameList.getNames().get(i).getId().equals("")) {
				id.setTextContent(" ");
			} else {
				id.setTextContent(nameList.getNames().get(i).getId());
			}
			taskNode.appendChild(id);
			Element name = xmldoc.createElement("name");
			if (nameList.getNames().get(i).getName().equals("")) {
				name.setTextContent(" ");
			} else {
				name.setTextContent(nameList.getNames().get(i).getName());
			}
			taskNode.appendChild(name);
			root.appendChild(taskNode);
		}
		// 保存
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer former = factory.newTransformer();
		former.transform(new DOMSource(xmldoc),
				new StreamResult(new File(StaticValues.HOME_PATH + mail + "/namelist/" + filename + ".xml")));
	}

	// 新增收集群组 记录收集
	public static void addNameState(File file, List<Name> nameList) throws Exception {
		// 创建文件工厂实例
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(false);
		DocumentBuilder db = dbf.newDocumentBuilder();
		// 创建Document对象
		Document xmldoc = db.parse(file);
		// 获取根节点
		Element root = xmldoc.getDocumentElement();
		for (int i = 0; i < nameList.size(); i++) {
			Element taskNode = xmldoc.createElement("user");
			Element id = xmldoc.createElement("id");
			if (nameList.get(i).getId().equals("")) {
				id.setTextContent(" ");
			} else {
				id.setTextContent(nameList.get(i).getId());
			}
			taskNode.appendChild(id);
			Element name = xmldoc.createElement("name");
			if (nameList.get(i).getName().equals("")) {
				name.setTextContent(" ");
			} else {
				name.setTextContent(nameList.get(i).getName());
			}
			taskNode.appendChild(name);
			Element date = xmldoc.createElement("date");
			if (nameList.get(i).getDate().equals("")) {
				date.setTextContent(" ");
			} else {
				date.setTextContent(nameList.get(i).getDate());
			}
			taskNode.appendChild(date);
			Element state = xmldoc.createElement("state");
			if (nameList.get(i).getState().equals("")) {
				state.setTextContent("未提交");
			} else {
				state.setTextContent(nameList.get(i).getState());
			}
			taskNode.appendChild(state);
			Element fileName = xmldoc.createElement("fileName");
			if (nameList.get(i).getFileName().equals("")) {
				fileName.setTextContent(" ");
			} else {
				fileName.setTextContent(nameList.get(i).getFileName());
			}
			taskNode.appendChild(fileName);
			root.appendChild(taskNode);
		}
		// 保存
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer former = factory.newTransformer();
		former.transform(new DOMSource(xmldoc), new StreamResult(file));
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
			Document doc = db.parse(new File(StaticValues.HOME_PATH + mail + "/namelist/" + filename + ".xml")); // 使用dom解析xml文件
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
			e.printStackTrace();
		}
		return names;
	}

	public static List<Name> getNameStateList(File file) {
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
			Document doc = db.parse(file); // 使用dom解析xml文件
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
						case "date":
							myname.setDate(value);
							break;
						case "state":
							myname.setState(value);
							break;
						case "fileName":
							myname.setFileName(value);
							break;
						}
					}
				}
				names.add(myname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return names;
	}

}
