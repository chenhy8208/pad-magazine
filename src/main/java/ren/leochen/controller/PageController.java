package ren.leochen.controller;

import org.apache.commons.collections.Buffer;
import org.apache.commons.collections.map.HashedMap;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.util.StringBuilders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ren.leochen.common.IOUtil;
import ren.leochen.common.ZipUtil;
import ren.leochen.common.ZipUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by chenhongyu on 2016/10/8.
 */
@Controller
public class PageController {

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

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        String content = request.getParameter("content");

        String plistPath = path + "/a.plist";
        File plist = new File(plistPath);
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

        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            e.printStackTrace();
        }
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
                sb.append(" <td>"+ data.get("id") +" </td>");
                sb.append(" <td align=\"center\">"+ data.get("url") +"</td>");
                sb.append(" <td>"+ data.get("name")+"</td>");
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
                        name = "<a href='"+ src + "' target='_blank'><img src='"+ src +"' height='40' /></a>";
                    }

                    nFile.put("name", file.getName());
                    nFile.put("url", name);
                    list.add(nFile);
                }
            }
        }

        return list;
    }

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, HttpServletResponse response, ModelMap model){
        String path = request.getParameter("path");
        model.put("path", path);

        try {
            path = URLDecoder.decode(path, "UTF-8");
        }catch (UnsupportedEncodingException e) {
            throw new RuntimeException("路径错误 -> err >>> " + e.getMessage());
        }

        model.put("realpath", path);

        String plistPath = path+"/a.plist";

        try(BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(plistPath)), "utf-8"));)
        {
            String content = "";
            String line = "";
            while((line = br.readLine()) != null)
            {
                content += (line + "\n");
            }

            model.put("content", content);
        } catch (Exception e) {
            throw new RuntimeException("读取plist文件失败 -> err >>> " + e.getMessage());
        }

        model.put("files", getMagezineFiles(path));
        return "edit";
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
