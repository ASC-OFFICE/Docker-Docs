## buildx bake variables ###
variable "TAG" {
    default = "" 
}

variable "ACCOUNT_NAME" { 
    default = "" 
}

variable "COMPANY_NAME" { 
    default = ""
}

variable "PREFIX_NAME" { 
    default = ""
} 

variable "PRODUCT_EDITION" {
    default = ""
}

group "apps" {
    targets = ["proxy", "converter", "docservice"]
}

### buildx bake targets ###

target "proxy" {
    target = "proxy"
    tags = ["docker.io/${ACCOUNT_NAME}/${PREFIX_NAME}-proxy${PRODUCT_EDITION}:${TAG}"]
    platforms = ["linux/amd64"]
    args = {
        "PRODUCT_EDITION": "${PRODUCT_EDITION}"
        "COMPANY_NAME": "${COMPANY_NAME}"
        "PRODUCT_URL": "${PRODUCT_URL}"
    }
}

target "converter" {
    target = "converter"  
    tags = ["docker.io/${ACCOUNT_NAME}/${PREFIX_NAME}-converter${PRODUCT_EDITION}:${TAG}"] 
    platforms = ["linux/amd64"]
    args = {
        "PRODUCT_EDITION": "${PRODUCT_EDITION}"
        "COMPANY_NAME": "${COMPANY_NAME}"
        "PRODUCT_URL": "${PRODUCT_URL}"
    }
}

target "docservice" {
    target = "docservice" 
    tags = ["docker.io/${ACCOUNT_NAME}/${PREFIX_NAME}-docservice${PRODUCT_EDITION}:${TAG}"]
    platforms = ["linux/amd64"]
    args = {
        "PRODUCT_EDITION": "${PRODUCT_EDITION}"
        "COMPANY_NAME": "${COMPANY_NAME}"
        "PRODUCT_URL": "${PRODUCT_URL}"
    }
}
