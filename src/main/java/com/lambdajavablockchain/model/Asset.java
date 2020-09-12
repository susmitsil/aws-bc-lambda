package com.lambdajavablockchain.model;

import javax.validation.constraints.NotNull;

/**
 * Asset chaincode model
 */

public class Asset {
    @NotNull
    private String assetId;
    @NotNull
    private String assetOwnerName;
    @NotNull
    private String email;
    @NotNull
    private String assetName;
    @NotNull
    private String assetType;
    @NotNull
    private String docType;
    @NotNull
    private String registeredDate;

    public String getAssetId() {
        return assetId;
    }

    public void setAssetId(String id) {
        this.assetId = id;
    }

    public String getAssetOwnerName() {
        return assetOwnerName;
    }

    public void setAssetOwnerName(String assetOwnerName) {
        this.assetOwnerName = assetOwnerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    public String getAssetType() {
        return assetType;
    }

    public void setAssetType(String assetType) {
        this.assetType = assetType;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    public String getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(String registeredDate) {
        this.registeredDate = registeredDate;
    }

    @Override
    public String toString() {
        return "{" +
                "\"assetId\":\"" + assetId + "\"" +
                ", \"assetName\":\"" + assetName + "\"" +
                ", \"email\":\"" + email + "\"" +
                ", \"assetOwnerName\":\"" + assetOwnerName + "\"" +
                ", \"registeredDate\":\"" + registeredDate + "\"" +
		", \"assetType\":\"" + assetType + "\"" +
		", \"docType\":\"" + docType + "\"" +
                "}";
    }
}