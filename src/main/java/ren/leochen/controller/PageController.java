package ren.leochen.controller;

import com.dd.plist.*;
import com.google.common.io.Resources;
import org.apache.commons.collections.Buffer;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.util.StringBuilders;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.SAXException;
import ren.leochen.common.IOUtil;
import ren.leochen.common.ZipUtil;
import ren.leochen.common.ZipUtils;
import sun.swing.StringUIClientPropertyKey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by chenhongyu on 2016/10/8.
 */
@Controller
public class PageController {

    /**
     * 上传文件替换原图片
     * @param request
     * @param response
     * @param file
     * @param model
     * @return
     */
    @RequestMapping("/uploadReplace")
    public @ResponseBody Map<String,String> uploadReplace(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model){
        Map<String,String> msg = new HashMap<String,String>();

        String path = request.getParameter("path");
        String name = request.getParameter("name");

        try {
            path = URLDecoder.decode(path, "UTF-8");
            name = URLDecoder.decode(name, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        if (file != null && !file.isEmpty()) {
            //String filename = StringUtils.trimToEmpty(file.getOriginalFilename());
            String filename = name;

            //文件保存目录路径
            File oFile = new File(path);
            //检查目录写权限
            if(!oFile.canWrite()){
                msg.put("state", "1");
                msg.put("msg", "上传失败，上传目录没有写权限！");
                msg.put("path", "");

                return msg;
            }

            try{
                File uploadedFile = new File(path + "/" + filename);
                file.transferTo(uploadedFile);

                msg.put("state", "0");
                msg.put("msg", "上传成功");
            }catch(Exception e){
                e.printStackTrace();
                msg.put("state", "0");
                msg.put("msg", "上传失败，出现异常！");
            }
        }

        return msg;
    }

    @RequestMapping("/upload")
    public @ResponseBody Map<String,String> upload(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file, ModelMap model){
        Map<String,String> msg = new HashMap<String,String>();

        String path = request.getParameter("path");

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        if (file != null && !file.isEmpty()) {
            String filename = StringUtils.trimToEmpty(file.getOriginalFilename());

            //文件保存目录路径
            File oFile = new File(path);
            //检查目录写权限
            if(!oFile.canWrite()){
                msg.put("state", "1");
                msg.put("msg", "上传失败，上传目录没有写权限！");
                msg.put("path", "");

                return msg;
            }

            try{
                File uploadedFile = new File(path + "/" + filename);
                file.transferTo(uploadedFile);

                msg.put("state", "0");
                msg.put("msg", "上传成功");
            }catch(Exception e){
                e.printStackTrace();
                msg.put("state", "0");
                msg.put("msg", "上传失败，出现异常！");
            }
        }

        return msg;
    }

    @RequestMapping("/createNew")
    public void createNew(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String magazinePathStr = request.getSession().getServletContext().getRealPath(sourceDirStr);
        String dirName = System.currentTimeMillis() + "";
        magazinePathStr += ("/" + dirName);

        File dir = new File(magazinePathStr);
        dir.mkdirs();

        File plist = new File(magazinePathStr + "/a.plist");
        try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(plist));)
        {
            StringBuffer sb = new StringBuffer();
            sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            sb.append("<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n");
            sb.append("<plist version=\"1.0\">\n");
            sb.append("<dict>\n");
            sb.append("<!-- 从这里开始 -->\n");
            sb.append("</dict>\n");
            sb.append("</plist>\n");

            bos.write(sb.toString().getBytes());
            bos.flush();
        } catch (Exception e) {
            throw new RuntimeException("创建plist文件失败 -> err >>> " + e.getMessage());
        }

        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/del")
    public void del(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");
        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }


        IOUtil.delDir(new File(path));

        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");
        String filename = request.getParameter("name");

        try {
            path = URLDecoder.decode(path, "UTF-8");
            filename = URLDecoder.decode(filename, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/temp");

        try {
            //String filename = System.currentTimeMillis()+"";
            File tempDir = new File(tempPath);
            if (!tempDir.exists()) {
                tempDir.mkdirs();
            }

            String zipPath = tempPath + "/" + filename + ".zip";
            File zip = new File(zipPath);
            if (zip.exists()) {
                zip.delete();
            }

            //ZipUtils.createZip(path+"/", zipPath);
            ZipUtil.fileToZip(path, tempPath, filename);

            response.sendRedirect("/temp/" + filename + ".zip");
            //new File(zipPath).delete();
        } catch (Exception e) {
            throw new RuntimeException("文件压缩失败 -> err >>> " + e.getMessage());
        }
    }

    @RequestMapping("/editSave")
    public void editSave(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        String path = request.getParameter("path");
        int page = NumberUtils.toInt(request.getParameter("page"));

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        String fromUrl = "";
        try {
            fromUrl = "/edit?path="+ URLEncoder.encode(path, "UTF-8") +"&page=" + page;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("encode编码path出现错误,err = " + e.getMessage());
        }


        String content = request.getParameter("content");
        String plistPath = path + "/a.plist";
        File plist = new File(plistPath);

        //1-备份以前的plist
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.SS");
        String bakPlistPath = path + "/a.plist." + sdf.format(new Date());
        try {
            FileUtils.copyFile(plist, new File(bakPlistPath));
        } catch (IOException e) {
            new RuntimeException("备份plist文件过程中出错了,err = " + e.getMessage());
        }

        if (page > 0 && StringUtils.isNoneBlank(StringUtils.trim(content))) {
            //分页编辑
            //2-删除以前plist中的对应页的效果
            try {
                NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);

                //修改正式的效果
                NSArray aPlus = (NSArray)root.get("APlus");
                //删除指定页
                this.deletePageFromNSArray(aPlus, page);
                //保存到原来的文件
                PropertyListParser.saveAsXML(root, plist);

            } catch (Exception e) {
                new RuntimeException("删除以前plist中的对应页的效果过程中出错了,err = " + e.getMessage());
            }

            //3-添加进行的内容
            try {
                //新的内容
                NSArray newContent = this.getNSArrayFromNSDictionaryString(content);

                //保存
                NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);
                NSArray aPlus = (NSArray)root.get("APlus");

                NSArray list = new NSArray(aPlus.getArray().length + newContent.getArray().length);
                int index = 0;
                //添加新的内容
                for (int i = 0; i < newContent.getArray().length; i ++) {
                    NSDictionary dict = (NSDictionary)newContent.getArray()[i];
                    list.setValue(index ++, dict);
                }
                //添加老的内容
                for (int i = 0; i < aPlus.getArray().length; i ++) {
                    NSDictionary dict = (NSDictionary)aPlus.getArray()[i];
                    list.setValue(index ++, dict);
                }

                root.put("APlus", list);
                //保存到原来的文件
                PropertyListParser.saveAsXML(root, plist);
            } catch (Exception e) {
                new RuntimeException("格式化新的xml过程中出错了,err = " + e.getMessage());
            }
        } else {
            //完整保存
            try(BufferedWriter br = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(plistPath)),"utf-8"));)
            {
                String[] text = content.split("\n");
                for (String str : text){
                    br.write(str);
                    //br.newLine();
                }
                br.flush();

            } catch (Exception e) {
                throw new RuntimeException("保存plist文件失败 -> err >>> " + e.getMessage());
            }
        }

        try {
            response.sendRedirect(fromUrl);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * NSDictionary字符串转成NSArray
     * @param content
     * @return
     */
    private NSArray getNSArrayFromNSDictionaryString(String content) {
        if (StringUtils.isBlank(content)) return null;

        //带上外面的格式
        String str = "";
        str += "<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> ";
        str += "<plist version=\"1.0\">";
        str += "<array>";
        str += content;
        str += "</array>";
        str += "</plist>";

        NSArray newContent = null;
        try {
            newContent = (NSArray) PropertyListParser.parse(str.getBytes());
        } catch (Exception e) {
            throw new RuntimeException("格式化新的内容出现错误,err = " + e.getMessage());
        }

        return newContent;
    }

    /**
     * 从数组中删除指定页
     * @param aPlus
     * @param page
     */
    private void deletePageFromNSArray(NSArray aPlus, int page) {
        for (int i = 0; i < aPlus.getArray().length; i ++) {
            NSDictionary dict = (NSDictionary)aPlus.getArray()[i];
            int index = NumberUtils.toInt(dict.get("Index")+"");
            if (index == page) {
                //标记
                aPlus.remove(i);
                this.deletePageFromNSArray(aPlus, page);
                break;
            }
        }

    }

    /**
     * 删除文件
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/deletePicture")
    public @ResponseBody Map<String,Object> deletePicture(HttpServletRequest request, ModelMap model)
    {
        Map<String, Object> rs = new HashedMap();

        String imgUrl = request.getParameter("imgUrl");

        try {
            imgUrl = URLDecoder.decode(imgUrl, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        if (StringUtils.isNoneBlank(imgUrl)) {
            File dir = new File(imgUrl);
            if (dir.exists()) {
                dir.delete();
            }
        }

        rs.put("err", 0);
        return rs;
    }

    @RequestMapping("/fileList")
    public @ResponseBody Map<String,Object> fileList(HttpServletRequest request, ModelMap model)
    {
        Map<String, Object> rs = new HashedMap();

        String path = request.getParameter("path");
        model.put("path", path);

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        StringBuffer sb = new StringBuffer();
        List<Map<String, Object>> list = getMagezineFiles(path);
        if (list != null && list.size() > 0) {
            for (Map data : list) {
                sb.append("<tr data-clipboard-text='"+ data.get("name") +"' class='selectPicTr'>");
                sb.append(" <td>"+ data.get("id") +"</td>");
                sb.append(" <td align=\"center\">"+ data.get("url") +"</td>");
                sb.append(" <td>"+ data.get("name")+"</td>");
                sb.append(" <td><a  href='javascript:void(0);' data-val='"+ data.get("id") +"' class='flashPicture'><i class=\"fa fa-repeat\"></i></a>&nbsp;" +
                          "<a class='replacePicture btn btn-blue shiny' data-val='"+ data.get("id") +"' href='javascript:void(0);'>替换</a>&nbsp;" +
                          "<a class='deletePicture btn btn-danger shiny' data-val='"+ data.get("id") +"' href='javascript:void(0);'>删除</a></td>");

                sb.append("</tr>");
            }
        }

        rs.put("data", sb.toString());

        return rs;
    }

    //获取杂志的文件列表
    private List getMagezineFiles(String path) {
        List<Map<String, Object>> list = new ArrayList<>();
        File dir = new File(path);
        if (dir.exists()) {
            String url = "/magazine/" + path.substring(path.lastIndexOf("/") + 1);
            File[] files = dir.listFiles();
            int count = 1;
            for (File file : files) {
                if (file.isFile() && !file.getName().endsWith(".plist")) {
                    Map<String, Object> nFile = new HashMap<>();
                    nFile.put("id", count ++);

                    String name = file.getName();
                    if (name.endsWith(".jpg") || name.endsWith(".png")|| name.endsWith(".jpeg")) {
                        String src = url + "/" + name;
                        src += "?time=" + new Date().getTime();
                        name = "<a href='"+ src + "' target='_blank'><img src='"+ src +"' height='80' /></a>";
                    }

                    nFile.put("name", file.getName());
                    nFile.put("url", name);
                    list.add(nFile);
                }
            }
        }

        return list;
    }

    /**
     * 绑定左侧的导航链接
     * @param model
     * @param path
     */
    private void bindNavLink(ModelMap model, String path) {
        //普通模式和页面模式的导航
        String normalPattern = "edit?path=" + path;
        String pagePattern = "page_edit?path=" + path;

        model.put("normalPattern", normalPattern);
        model.put("pagePattern", pagePattern);
    }

    /**
     * 设置path的信息
     * @param model
     * @param path
     * @return
     */
    private String setPathToModel(ModelMap model, String path) {

        model.put("path", path);

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        model.put("realpath", path);

        return path;
    }

    /**
     * 获取plist里面的内容值,获取某一页的
     * @param model
     * @param plistPath
     * @param page
     * @return
     */
    private String getPlistContentFromPath(ModelMap model, String plistPath, int page) {

        File plist = new File(plistPath);
        long totalPage = 0;
        try {
            NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);

            //修改总页数
            totalPage = NumberUtils.toLong(root.get("totalPage").toString());
            System.out.println("totalPage = " + totalPage);
            if (page > totalPage) {
                model.put("content", "");
                return "";
            }

            //这一页的内容集合
            StringBuilder sb = new StringBuilder();

            //修改正式的效果
            NSArray aPlus = (NSArray)root.get("APlus");

            //修改正式效果的内部效果
            for (int i = 0; i < aPlus.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)aPlus.getArray()[i];
                int index = NumberUtils.toInt(dict.get("Index")+"");
                if (index == page) {
                    String xml = fileterDontNeedXML(dict.toXMLPropertyList());
                    System.out.println("xml = " + xml);
                    sb.append(xml);
                }
            }

            String content = sb.toString();
            model.put("content", content);
            return content;
        } catch (Exception e) {
            throw new RuntimeException("读取plist文件失败 -> err >>> " + e.getMessage());
        }
    }

    /**
     * 过滤xml中不需要的部分
     * <?xml version="1.0" encoding="UTF-8"?>
     * <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     * <plist version="1.0">
     * <dict>
     * <key>Index</key>
     * <string>25</string>
     * <key>AType</key>
     * <string>mask</string>
     * <key>Content</key>
     * <dict>
     * <key>Content</key>
     * <string>25_big.jpg</string>
     * <key>pos</key>
     * <string>0,-696,768,696</string>
     * <key>pos_end</key>
     * <string>0,0,768,696</string>
     * <key>stay</key>
     * <string>0</string>
     * <key>StartPos</key>
     * <string>0,0,768,696</string>
     * <key>OverPos</key>
     * <string>0,0,768,696</string>
     * <key>dur</key>
     * <string>0.8</string>
     * <key>delay</key>
     * <string>0</string>
     * </dict>
     * </dict>
     * </plist>
     * @param xml
     * @return
     */
    private String fileterDontNeedXML(String xml) {
        if (StringUtils.isBlank(xml)) return "";

        int startPos = xml.indexOf("<dict>");
        int endPos = xml.indexOf("</plist>");
        xml = xml.substring(startPos, endPos);
        return xml;
    }

    /**
     * 获取plist里面的内容值
     * @param model
     * @param plistPath
     * @return
     */
    private String getPlistContentFromPath(ModelMap model, String plistPath) {
        try(BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(plistPath)), "utf-8"));)
        {
            String content = "";
            String line = "";
            while((line = br.readLine()) != null)
            {
                content += (line + "\n");
            }

            model.put("content", content);

            return content;
        } catch (Exception e) {
            throw new RuntimeException("读取plist文件失败 -> err >>> " + e.getMessage());
        }
    }

    /**
     * 分页编辑
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/listEditUrl")
    public String listEditUrl(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");

        bindNavLink(model, path);
        String url = "/magazine/" + path.substring(path.lastIndexOf("/") + 1);
        String realpath = setPathToModel(model, path);
        String plistPath = realpath+"/a.plist";

        String encodePath = null;
        try {
            encodePath = URLEncoder.encode(realpath, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        File plist = new File(plistPath);
        long totalPage = 0;
        try {
            NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);

            //修改总页数
            totalPage = NumberUtils.toLong(root.get("totalPage").toString());
            System.out.println("totalPage = " + totalPage);
            model.put("totalPage", totalPage);
        } catch (Exception err) {
            err.printStackTrace();
        }

        model.put("url", url);
        model.put("path", realpath);
        model.put("encodePath", encodePath);
        return "listEditUrl";
    }

    /**
     * 完整编辑
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");

        int page = NumberUtils.toInt(request.getParameter("page"));

        bindNavLink(model, path);
        String realpath = setPathToModel(model, path);
        String plistPath = realpath+"/a.plist";

        String content = "";
        if (page <= 0) {
            content = getPlistContentFromPath(model, plistPath);
        } else {
            content = getPlistContentFromPath(model, plistPath, page);
        }

        try {
            model.put("backUrl", page>0? "listEditUrl?path=" + URLEncoder.encode(path, "UTF-8"): "index");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("encode编码path出现错误,err = " + e.getMessage());
        }
        model.put("page", page<0? 0: page);
        //model.put("files", getMagezineFiles(realpath));
        return "edit";
    }

    /**
     * 获取一个Key元素后面的value值
     * @param key
     * @return
     */
    public Element getPlistKeyNodeValue(Element key) {
        if (key == null) return null;

        return key.nextElementSibling();
    }

    @RequestMapping("/page_edit")
    public String pageEdit(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");

        bindNavLink(model, path);
        String realpath = setPathToModel(model, path);
        String plistPath = realpath+"/a.plist";
        String content = getPlistContentFromPath(model, plistPath);

        //Jaxp解析文档
        long totalPage = 0;
        try {
            org.jsoup.nodes.Document document = Jsoup.parse(new File(plistPath), "UTF-8"); //必须使用这种方式解析

            Elements elements = document.getElementsContainingOwnText("totalPage");
            if (elements != null && elements.size() > 0) {
                Element element = getPlistKeyNodeValue(elements.get(0));
                if (element != null) {
                    totalPage = NumberUtils.toLong(element.text());
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("totalPage = " + totalPage);


        model.put("totalPage", totalPage);
        //model.put("files", getMagezineFiles(realpath));
        return "page_edit";
    }

    /**
     * 删除页面，删除某一页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/deletePage")
    public @ResponseBody Map<String,Object> deletePage(HttpServletRequest request, ModelMap model)
    {
        Map<String, Object> rs = new HashedMap();

        String path = request.getParameter("path");
        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        String plistPath = path + "/a.plist";
        long pageIndex = NumberUtils.toLong(request.getParameter("pageIndex"));
        boolean result = doDeletePage(plistPath, pageIndex);

        rs.put("state", result? 1: 0);

        return rs;
    }

    /**
     * 在某页之前插入一页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/insertPage")
    public @ResponseBody Map<String,Object> insertPage(HttpServletRequest request, ModelMap model)
    {
        Map<String, Object> rs = new HashedMap();

        String path = request.getParameter("path");
        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        String plistPath = path + "/a.plist";
        long pageIndex = NumberUtils.toLong(request.getParameter("pageIndex"));
        boolean result = doInsertPage(plistPath, pageIndex);

        rs.put("state", result? 1: 0);

        return rs;
    }


    /**
     * jsoup的document写回到文件
     * @param plist
     * @param document
     */
    private void writeToPlistFile(File plist, org.jsoup.nodes.Document document) throws Exception {
        try(PrintWriter writer = new PrintWriter(plist, "UTF-8")){
            writer.write(document.html());
            writer.flush();
            writer.close();
        }
    }

    /**
     * NSArray下面的dictionary里面的index,大于的加一
     * @param array
     * @param pageIndex
     */
    private void insertIndexFromNSArray(NSArray array,long pageIndex) {
        if (array != null && array.count() > 0) {
            for (int i = 0; i < array.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)array.getArray()[i];
                long index = NumberUtils.toLong(dict.get("Index").toString());
                //大于这一页的需要+1
                if (index > pageIndex) {
                    dict.put("Index", (index + 1)+"");
                    array.setValue(i, dict);
                }
            }
        }
    }

    /**
     * 删除NSArray下面的dictionary里面的index,相同的删除，大于的减一
     * @param array
     * @param pageIndex
     */
    private void removeIndexFromNSArray(NSArray array,long pageIndex) {
        if (array != null && array.count() > 0) {
            for (int i = 0; i < array.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)array.getArray()[i];
                long index = NumberUtils.toLong(dict.get("Index").toString());
                //正好那一页需要删除
                if (index == pageIndex) {
                    array.remove(i);
                }
            }

            for (int i = 0; i < array.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)array.getArray()[i];
                long index = NumberUtils.toLong(dict.get("Index").toString());
                //大于这一页的需要-1
                if (index > pageIndex) {
                    dict.put("Index", (index - 1)+"");
                    array.setValue(i, dict);
                }
            }
        }
    }

    /**
     * 判断是背景图片，或者预览图
     * @param filename
     * @param pageIndex
     * @return
     */
    private boolean isSystemBackgroundPicture(String filename, long pageIndex) {
        return filename.equalsIgnoreCase(pageIndex+".jpg") ||
                filename.equalsIgnoreCase(pageIndex+".png") ||
                filename.equalsIgnoreCase("page_"+pageIndex+".jpg") ||
                filename.equalsIgnoreCase("page_"+pageIndex+".png");
    }

    /**
     * 将文件名改成文件名+step
     * @param dirPath
     * @param currentIndex
     * @param step
     */
    private void updatePictureName(String dirPath, long currentIndex, int step) {
        long newIndex = (currentIndex + step);

        if (new File(dirPath + "/" + currentIndex+".jpg").exists()) {
            new File(dirPath + "/" + currentIndex+".jpg").renameTo(new File(dirPath + "/" + newIndex+".jpg"));
        }

        if (new File(dirPath + "/" + currentIndex+".png").exists()) {
            new File(dirPath + "/" + currentIndex+".png").renameTo(new File(dirPath + "/" + newIndex+".png"));
        }

        if (new File(dirPath + "/page_"+currentIndex+".jpg").exists()) {
            new File(dirPath + "/page_"+currentIndex+".jpg").renameTo(new File(dirPath + "/page_"+newIndex+".jpg"));
        }

        if (new File(dirPath + "/page_"+currentIndex+".png").exists()) {
            new File(dirPath + "/page_"+currentIndex+".png").renameTo(new File(dirPath + "/page_"+newIndex+".png"));
        }
    }

    /**
     * plist文档，在指定页码之前插入，把后面所有的页码都往后挪
     * @param plistPath
     * @param pageIndex
     * @return
     */
    private boolean doInsertPage(String plistPath, long pageIndex) {
        File plist = new File(plistPath);
        long totalPage = 0;
        try {
            NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);

            //修改总页数
            totalPage = NumberUtils.toLong(root.get("totalPage").toString());
            System.out.println("totalPage = " + totalPage);
            root.put("totalPage", (totalPage + 1) +"");

            //修改menu，如果GO的数字大于页码，则需要+1
            NSArray menu = (NSArray)root.get("menu");
            for (int i = 0; i < menu.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)menu.getArray()[i];
                long index = NumberUtils.toLong(dict.get("Go").toString());
                //GO跳转，大于这一页的需要-1
                if (index > pageIndex) {
                    dict.put("Go", (index + 1)+"");
                    menu.setValue(i, dict);
                }
            }

            //修改nav导航
            NSArray nav = (NSArray)root.get("nav");
            insertIndexFromNSArray(nav, pageIndex);

            //修改正式的效果
            NSArray aPlus = (NSArray)root.get("APlus");
            insertIndexFromNSArray(aPlus, pageIndex);

            //修改正式效果的内部效果
            for (int i = 0; i < aPlus.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)aPlus.getArray()[i];
                if(dict.get("AType") == null) continue;

                String aType = dict.get("AType").toString();

                //修改带跳转的内容，大于删除页的，要加一
                if (aType.equalsIgnoreCase("menu")) {
                    NSDictionary content = (NSDictionary)dict.get("Content");

                    if (content.get("Go") != null) {
                        long index = NumberUtils.toLong(content.get("Go").toString());
                        //GO跳转，大于这一页的需要+1
                        if (index > pageIndex) {
                            content.put("Go", (index + 1) + "");
                            dict.put("Content", content);
                            aPlus.setValue(i, dict);
                        }
                    }

                }
            }

            //图片文件处理
            File parentDir = plist.getParentFile();
            //倒过来把后面的图片文件名进行修改，满足加一的条件
            String dirPath = parentDir.getAbsolutePath();
            for (long i = totalPage; i > pageIndex; i --) {
                updatePictureName(dirPath, i, +1);
            }

            //保存到原来的文件
            PropertyListParser.saveAsXML(root, plist);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * plist文档，删除指定的页面，把后面所有的页码都往前挪
     * @param plistPath
     * @param pageIndex
     * @return
     */
    private boolean doDeletePage(String plistPath, long pageIndex) {

        File plist = new File(plistPath);
        long totalPage = 0;
        try {
            NSDictionary root = (NSDictionary) PropertyListParser.parse(plist);

            //修改总页数
            totalPage = NumberUtils.toLong(root.get("totalPage").toString());
            System.out.println("totalPage = " + totalPage);
            root.put("totalPage", (totalPage - 1) +"");

            //修改menu，如果GO的数字大于删除的页码，则需要-1
            NSArray menu = (NSArray)root.get("menu");
            for (int i = 0; i < menu.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)menu.getArray()[i];
                long index = NumberUtils.toLong(dict.get("Go").toString());
                //GO跳转，大于这一页的需要-1
                if (index > pageIndex) {
                    dict.put("Go", (index - 1)+"");
                    menu.setValue(i, dict);
                }
            }

            //修改nav导航
            NSArray nav = (NSArray)root.get("nav");
            removeIndexFromNSArray(nav, pageIndex);

            //修改正式的效果
            NSArray aPlus = (NSArray)root.get("APlus");
            removeIndexFromNSArray(aPlus, pageIndex);

            //修改正式效果的内部效果
            for (int i = 0; i < aPlus.getArray().length; i ++) {
                NSDictionary dict = (NSDictionary)aPlus.getArray()[i];
                if(dict.get("AType") == null) continue;

                String aType = dict.get("AType").toString();

                //修改带跳转的内容，大于删除页的，要减一
                if (aType.equalsIgnoreCase("menu")) {
                    NSDictionary content = (NSDictionary)dict.get("Content");

                    if (content.get("Go") != null) {
                        long index = NumberUtils.toLong(content.get("Go").toString());
                        //GO跳转，大于这一页的需要-1
                        if (index > pageIndex) {
                            content.put("Go", (index - 1) + "");
                            dict.put("Content", content);
                            aPlus.setValue(i, dict);
                        }
                    }

                }
            }

            //图片文件处理
            File parentDir = plist.getParentFile();
            if (parentDir != null && parentDir.isDirectory()) {
                for (File file : parentDir.listFiles()) {
                    if (file.isFile()) {
                        String name = file.getName();
                        //删除对应的背景图、预览图
                        if (isSystemBackgroundPicture(name, pageIndex)) {
                            file.delete();
                        }
                    }
                }
            }

            //倒过来把后面的图片文件名进行修改，满足减1的条件
            String dirPath = parentDir.getAbsolutePath();
            //for (long i = totalPage; i > pageIndex; i --) {
            for (long i = pageIndex + 1; i <= totalPage; i ++) {
                updatePictureName(dirPath, i, -1);
            }

            //保存到原来的文件
            PropertyListParser.saveAsXML(root, plist);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }


    @RequestMapping("/index")
    public void index(HttpServletRequest request, ModelMap model) {
        //读取magazine目录
        String magazinePathStr = request.getSession().getServletContext().getRealPath(sourceDirStr);
        Path magazinePath = Paths.get(magazinePathStr);

        List<Map<String, Object>> list = new ArrayList<>();
        if (Files.exists(magazinePath) && magazinePath.toFile().isDirectory()) {
            //读取文件夹
            File[] files = magazinePath.toFile().listFiles(new FileFilter(){
                @Override
                public boolean accept(File pathname) {
                    return pathname.isDirectory();
                }
            });

            if (files != null) {
                int count = 1;
                for (File f: files) {
                    Map<String, Object> data = new HashMap<>();
                    String path = f.getPath().replace("\\", "/");
                    String encodePath = null;
                    try {
                        encodePath = URLEncoder.encode(path, "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    data.put("id", count ++);
                    data.put("name", f.getName());
                    data.put("path", path);
                    data.put("url", "/download?path=" + encodePath+"&name=" + f.getName());
                    data.put("editUrl", "/edit?path=" + encodePath);
                    data.put("listEditUrl", "/listEditUrl?path=" + encodePath);
                    data.put("delUrl", "/del?path=" + encodePath);
                    list.add(data);
                }
            }
        }

        model.put("magazinePathStr", magazinePathStr);
        model.put("list", list);
    }

    private static final String sourceDirStr = "/WEB-INF/magazine";
    private static final Logger logger = LogManager.getLogger(PageController.class);
}
