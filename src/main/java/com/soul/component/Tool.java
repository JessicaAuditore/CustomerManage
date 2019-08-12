package com.soul.component;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Tool {

    //调用对象中所有的get方法，如果为""，则调用set方法设置为null
    public static Object setNull(Object obj) {
        //获得实体类名
        Class clazz = obj.getClass();
        //获得属性
        Field[] fields = obj.getClass().getDeclaredFields();
        try {
            for (Field field : fields) {
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(), clazz);
                //获得get方法
                Method getMethod = pd.getReadMethod();
                if ("".equals(getMethod.invoke(obj))) {
                    //获得set方法
                    Method setMethod = pd.getWriteMethod();
                    setMethod.invoke(obj, (Object) null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }
}
