package cq.yezi.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

/**
 * ResultModel
 */
public class ResultModel<T> implements Serializable {
    private int ret;
    private String message;
    private T data;
    private long id;

    public int getRet() {
        return ret;
    }

    @JsonProperty(value = "Ret")
    public void setRet(int ret) {
        this.ret = ret;
    }

    public String getMessage() {
        return message;
    }

    @JsonProperty(value = "Message")
    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    @JsonProperty(value = "Data")
    public void setData(T data) {
        this.data = data;
    }

    public long getId() {
        return id;
    }

    @JsonProperty(value = "Id")
    public void setId(long id) {
        this.id = id;
    }
}
