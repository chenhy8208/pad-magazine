package ren.leochen.common;

import java.io.File;

/**
 * Created by chenhongyu on 29/08/2017.
 */
public class IOUtil {
    public static void delDir(File f) {
        // 判断是否是一个目录, 不是的话跳过, 直接删除; 如果是一个目录, 先将其内容清空.
        if(f.isDirectory()) {
            // 获取子文件/目录
            File[] subFiles = f.listFiles();
            // 遍历该目录
            for (File subFile : subFiles) {
                // 递归调用删除该文件: 如果这是一个空目录或文件, 一次递归就可删除. 如果这是一个非空目录, 多次
                // 递归清空其内容后再删除
                delDir(subFile);
            }
        }
        // 删除空目录或文件
        f.delete();
    }
}
