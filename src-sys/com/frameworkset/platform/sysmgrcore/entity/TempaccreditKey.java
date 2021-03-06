/*
 * WARNING: DO NOT EDIT THIS FILE. This is a generated file that is synchronized
 * by MyEclipse Hibernate tool integration.
 *
 * Created Wed Feb 08 15:37:32 CST 2006 by MyEclipse Hibernate Tool.
 */
package com.frameworkset.platform.sysmgrcore.entity;

import java.io.Serializable;

/**
 * A class representing a composite primary key id for the td_sm_tempaccredit
 * table.  This object should only be instantiated for use with instances 
 * of the Tempaccredit class.
 */
public class TempaccreditKey
    implements Serializable
{
    /** The cached hash code value for this instance.  Settting to 0 triggers re-calculation. */
    private volatile int hashValue = 0;

    /** The value of the OP_ID component of this composite id. */
    private String opId;

    /** The value of the USER_ID component of this composite id. */
    private Integer userId;

    /**
     * Simple constructor of TempaccreditKey instances.
     */
    public TempaccreditKey()
    {
    }

    /**
     * Returns the value of the opId property.
     * @return String
     */
    public String getOpId()
    {
        return opId;
    }

    /**
     * Sets the value of the opId property.
     * @param opId
     */
    public void setOpId(String opId)
    {
        hashValue = 0;
        this.opId = opId;
    }

    /**
     * Returns the value of the userId property.
     * @return String
     */
    public Integer getUserId()
    {
        return userId;
    }

    /**
     * Sets the value of the userId property.
     * @param userId
     */
    public void setUserId(Integer userId)
    {
        hashValue = 0;
        this.userId = userId;
    }

    /**
     * Implementation of the equals comparison on the basis of equality of the id components.
     * @param rhs
     * @return boolean
     */
    public boolean equals(Object rhs)
    {
        if (rhs == null)
            return false;
        if (! (rhs instanceof TempaccreditKey))
            return false;
        TempaccreditKey that = (TempaccreditKey) rhs;
        if (this.getOpId() != null && that.getOpId() != null)
        {
            if (! this.getOpId().equals(that.getOpId()))
            {
                return false;
            }
        }
        if (this.getUserId() != null && that.getUserId() != null)
        {
            if (! this.getUserId().equals(that.getUserId()))
            {
                return false;
            }
        }
        return true;
    }

    /**
     * Implementation of the hashCode method conforming to the Bloch pattern with
     * the exception of array properties (these are very unlikely primary key types).
     * @return int
     */
    public int hashCode()
    {
        if (this.hashValue == 0)
        {
            int result = 17;
            int opIdValue = this.getOpId() == null ? 0 : this.getOpId().hashCode();
            result = result * 37 + opIdValue;
            int userIdValue = this.getUserId() == null ? 0 : this.getUserId().hashCode();
            result = result * 37 + userIdValue;
            this.hashValue = result;
        }
        return this.hashValue;
    }
}
