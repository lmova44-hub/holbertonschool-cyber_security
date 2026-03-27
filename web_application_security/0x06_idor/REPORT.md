
# CyberBank Security Assessment Report

## 1. Introduction
Bu hesabat CyberBank onlayn bankçılıq tətbiqinin təhlükəsizlik auditinin nəticələrini əks etdirir. Audit zamanı əsas diqqət tətbiqdəki avtorizasiya mexanizmlərinə və **IDOR (Insecure Direct Object Reference)** zəifliklərinə yönəldilmişdir.

## 2. Methodology
Qiymətləndirmə zamanı aşağıdakı alətlər və metodlardan istifadə edilmişdir:
* **Burp Suite Professional:** Sorğuların tutulması (Intercept), təkrar edilməsi (Repeater) və analiz edilməsi üçün.
* **Manual Testing:** API endpoint-lərinin parametrlərini dəyişərək məntiqi xətaların tapılması.
* **IDOR Enumeration:** İstifadəçi və hesab ID-lərinin ardıcıl dəyişdirilməsi.

## 3. Vulnerability Details

### Vulnerability 1: IDOR on Account Balance Disclosure
* **Description:** `/api/accounts/[account_number]` endpoint-i istifadəçinin səlahiyyətlərini yoxlamadan istənilən hesabın balansını göstərir.
* **Impact:** **High.** Hücumçu başqa müştərilərin maliyyə vəziyyəti haqqında məlumat toplaya bilər.
* **Reproduction Steps:**
    1.  Repeater-də `/api/customer/info/[target_id]` sorğusu ilə hədəf müştərinin hesab nömrəsini tapın.
    2.  `/api/accounts/[account_number]` sorğusunu göndərin.
* **Evidence:** `Flag 1: IDOR_SUCCESS_...`



### Vulnerability 2: IDOR on Sensitive Card Information
* **Description:** `/api/cards/info/[customer_id]` endpoint-i vasitəsilə istənilən istifadəçinin tam kart nömrəsi və CVV kodu əldə edilə bilər.
* **Impact:** **Critical.** Bu məlumatlarla hücumçu qurbanın adından onlayn alış-veriş edə bilər.
* **Evidence:** `Flag 2: 84095d7149...`

### Vulnerability 3: Transaction Hijacking via Parameter Manipulation
* **Description:** Ödəniş təsdiqləmə (3D Secure) mərhələsində `account_id` parametrini dəyişməklə ödənişi başqa istifadəçinin hesabından çıxarmaq mümkündür.
* **Impact:** **Critical.** Maliyyə oğurluğu və icazəsiz tranzaksiyalar.



