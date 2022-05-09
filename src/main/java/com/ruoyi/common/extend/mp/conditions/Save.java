package com.ruoyi.common.extend.mp.conditions;

import java.io.Serializable;
import java.util.Map;

public interface Save<Children, R> extends Serializable {
    default Children set(R column, Object val) {
        return this.set(true, column, val);
    }

    default Children set(boolean condition, R column, Object val) {
        return this.set(condition, column, val, null);
    }

    default Children set(R column, Object val, String mapping) {
        return this.set(true, column, val, mapping);
    }

    Children set(boolean condition, R column, Object val, String mapping);

    Children setMap(Map<String, String> map);

    String getSql();
}
