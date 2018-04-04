# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "ALTERNATE_PRODUCTS", primary_key: ["PROD_CODE", "ALT_PROD_CODE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "代替商品" do |t|
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "ALT_PROD_CODE", limit: 16, null: false, comment: "代替商品コード"
    t.integer "PRIORITY", default: 1, comment: "優先順位"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "APPROVAL", primary_key: "APPROVAL_CODE", id: :string, limit: 2, comment: "承認権限コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "電子承認マスタ" do |t|
    t.string "APPROVAL_NAME", limit: 40, comment: "承認権限名"
  end

  create_table "AUTO_NUMBER", primary_key: ["SLIP_TYPE", "YEARMONTH"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "自動採番マスタ" do |t|
    t.string "SLIP_TYPE", limit: 2, null: false, comment: "伝票種別コード"
    t.datetime "YEARMONTH", null: false, comment: "年月"
    t.integer "LAST_SILP_NO", default: 0, null: false, comment: "最終伝票番号"
  end

  create_table "BANK", primary_key: "BANK_ACUT_CODE", id: :string, limit: 8, comment: "入金口座コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "入金口座マスタ" do |t|
    t.string "RECIVE_ACT_NAME", limit: 30, comment: "入金口座名"
    t.datetime "APPL_START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "適用開始日"
    t.datetime "APPL_END_DATE", default: "2100-12-31 00:00:00", comment: "適用終了日"
    t.string "START_ACT_NAME", limit: 30, comment: "適用開始後入金口座名"
    t.string "RECIVE_BANK_ACT_TYPE", limit: 1, comment: "入金口座区分"
    t.string "RECIVE_ACT_NO", limit: 12, comment: "入金口座番号"
    t.string "BANK_ACT_TYPE", limit: 1, comment: "銀行口座種別"
    t.string "ACT_NAME", limit: 20, comment: "口座名義人"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "開始日"
    t.string "A_BANK_CODE", limit: 4, comment: "全銀協銀行コード"
    t.string "A_BANK_BLNC_CODE", limit: 3, comment: "全銀協支店コード"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.datetime "UPDATE_PLG_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "プログラム更新日時"
    t.string "UPDATE_PGM", limit: 50, comment: "更新プログラム名"
    t.index ["DEPT_CODE", "START_DATE"], name: "DEPT_CODE"
  end

  create_table "BOM", primary_key: ["PROD_CODE", "BOM_CODE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "部品表" do |t|
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "BOM_CODE", limit: 16, null: false, comment: "部品コード"
    t.integer "QUANTITY", default: 1, null: false, comment: "部品数量"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "CATEGORY_TYPE", primary_key: "CATEGORY_TYPE_CODE", id: :string, limit: 2, comment: "取引先分類種別コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "取引先分類種別マスタ" do |t|
    t.string "CATE_TYPE_NAME", limit: 20, comment: "取引先分類種別名"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "COMPANYS_MST", primary_key: "COMP_CODE", id: :string, limit: 8, comment: "取引先コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "取引先マスタ" do |t|
    t.string "COMP_NAME", limit: 40, null: false, comment: "取引先名"
    t.string "COMP_KANA", limit: 40, comment: "取引先名カナ"
    t.integer "SUP_TYPE", default: 0, comment: "仕入先区分"
    t.string "ZIP_CODE", limit: 8, comment: "郵便番号"
    t.string "STATE", limit: 4, comment: "都道府県"
    t.string "ADDRESS1", limit: 40, comment: "住所１"
    t.string "ADDRESS2", limit: 40, comment: "住所２"
    t.integer "NO_SALES_FLG", default: 0, comment: "取引禁止フラグ"
    t.integer "WIDE_USE_TYPE", comment: "雑区分"
    t.string "COMP_GROUP_CODE", limit: 4, null: false, comment: "取引先グループコード"
    t.integer "MAX_CREDIT", comment: "与信限度額"
    t.integer "TEMP_CREDIT_UP", default: 0, comment: "与信一時増加枠"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "COMPANY_CATEGORY", primary_key: ["COMP_CATE_CODE", "CATEGORY_TYPE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "取引先分類マスタ" do |t|
    t.string "CATEGORY_TYPE", limit: 2, null: false, comment: "取引先分類種別コード"
    t.string "COMP_CATE_CODE", limit: 8, null: false, comment: "取引先分類コード"
    t.string "COMP_CATE_NAME", limit: 30, comment: "取引先分類名"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["CATEGORY_TYPE"], name: "CATEGORY_TYPE"
  end

  create_table "COMPANY_CATEGORY_GROUP", primary_key: ["CATEGORY_TYPE", "COMP_CODE", "COMP_CATE_CODE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "取引先分類所属マスタ" do |t|
    t.string "CATEGORY_TYPE", limit: 2, null: false, comment: "取引先分類種別コード"
    t.string "COMP_CATE_CODE", limit: 8, null: false, comment: "取引先分類コード"
    t.string "COMP_CODE", limit: 8, null: false, comment: "取引先コード"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["COMP_CATE_CODE", "CATEGORY_TYPE"], name: "COMP_CATE_CODE"
  end

  create_table "COMPANY_GROUP_MST", primary_key: "COMP_GROUP_CODE", id: :string, limit: 4, comment: "取引先グループコード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "取引先グループマスタ" do |t|
    t.string "GROUP_NAME", limit: 40, comment: "取引先グループ名"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "CREDIT", primary_key: "CREDIT_NO", id: :string, limit: 10, comment: "入金番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "入金データ" do |t|
    t.datetime "CREDIT_DATE", comment: "入金日"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "開始日"
    t.string "COMP_CODE", limit: 8, null: false, comment: "顧客コード"
    t.integer "COMP_SUB_NO", comment: "顧客枝番"
    t.integer "PAY_METHOD_TYPE", default: 1, comment: "支払方法区分"
    t.string "BANK_ACUT_CODE", limit: 8, comment: "入金口座コード"
    t.integer "RECEIVED_AMNT", default: 0, comment: "入金金額"
    t.integer "RECEIVED", default: 0, comment: "消込金額"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.datetime "UPDATE_PLG_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "プログラム更新日時"
    t.string "UPDATE_PGM", limit: 50, comment: "更新プログラム名"
    t.index ["DEPT_CODE", "START_DATE"], name: "DEPT_CODE"
  end

  create_table "CREDIT_BALANCE", primary_key: "COMP_CODE", id: :string, limit: 8, comment: "取引先コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "与信残高データ" do |t|
    t.integer "ORDER_BALANCE", default: 0, comment: "受注残高"
    t.integer "REC_BALANCE", default: 0, comment: "債権残高"
    t.integer "PAY_BALANCE", default: 0, comment: "債務残高"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "CUSTOMERS_MST", primary_key: ["CUST_CODE", "CUST_SUB_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "顧客マスタ" do |t|
    t.string "CUST_CODE", limit: 8, null: false, comment: "顧客コード"
    t.integer "CUST_SUB_NO", null: false, comment: "顧客枝番"
    t.integer "CUST_TYPE", default: 0, comment: "顧客区分"
    t.string "AR_CODE", limit: 8, null: false, comment: "請求先コード"
    t.integer "AR_SUB_NO", comment: "請求先枝番"
    t.string "PAYER_CODE", limit: 8, null: false, comment: "回収先コード"
    t.integer "PAYER_SUB_NO", comment: "回収先枝番"
    t.string "CUST_NAME", limit: 40, null: false, comment: "顧客名"
    t.string "CUST_KANA", limit: 40, comment: "顧客名カナ"
    t.string "EMP_CODE", limit: 10, null: false, comment: "自社担当者コード"
    t.string "CUST_USER_NAME", limit: 20, comment: "顧客担当者名"
    t.string "CUST_USER_DEP_NAME", limit: 40, comment: "顧客部門名"
    t.string "CUST_ZIP_CODE", limit: 8, comment: "顧客郵便番号"
    t.string "CUST_STATE", limit: 4, comment: "顧客都道府県"
    t.string "CUST_ADDRESS1", limit: 40, comment: "顧客住所１"
    t.string "CUST_ADDRESS2", limit: 40, comment: "顧客住所２"
    t.string "CUST_TEL", limit: 13, comment: "顧客電話番号"
    t.string "CUST_FAX", limit: 13, comment: "顧客FAX番号"
    t.string "CUST_EMAIL", limit: 100, comment: "顧客メールアドレス"
    t.integer "CUST_AR_FLAG", comment: "顧客請求区分"
    t.integer "CUST_CLOSE_DATE1", null: false, comment: "顧客締日１"
    t.integer "CUST_PAY_MONTHS1", default: 1, comment: "顧客支払月１"
    t.integer "CUST_PAY_DATES1", comment: "顧客支払日１"
    t.integer "CUST_PAY_METHOD1", default: 1, comment: "顧客支払方法１"
    t.integer "CUST_CLOSE_DATE2", null: false, comment: "顧客締日２"
    t.integer "CUST_PAY_MONTHS2", default: 1, comment: "顧客支払月２"
    t.integer "CUST_PAY_DATES2", comment: "顧客支払日２"
    t.integer "CUST_PAY_METHOD2", default: 1, comment: "顧客支払方法２"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "DEPT_MST", primary_key: ["DEPT_CODE", "START_DATE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "部門マスタ" do |t|
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "開始日"
    t.datetime "END_DATE", default: "2100-12-31 00:00:00", comment: "終了日"
    t.string "DEP_NAME", limit: 40, comment: "部門名"
    t.integer "LAYER", default: 0, null: false, comment: "組織階層"
    t.string "UP_DIVISION_CODE", limit: 5, null: false, comment: "上位部門コード"
    t.integer "SLIT_YN", default: 1, comment: "伝票入力可否"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "DESTINATIONS_MST", primary_key: ["COMP_CODE", "DIST_NO", "COMP_SUB_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "出荷先マスタ" do |t|
    t.string "COMP_CODE", limit: 8, null: false, comment: "取引先コード"
    t.integer "COMP_SUB_NO", null: false, comment: "顧客枝番"
    t.integer "DIST_NO", null: false, comment: "出荷先番号"
    t.string "DIST_NAME", limit: 40, null: false, comment: "出荷先名"
    t.string "ZIP_CODE", limit: 8, comment: "出荷先郵便番号"
    t.string "ADDRESS1", limit: 40, comment: "出荷先住所１"
    t.string "ADDRESS2", limit: 40, comment: "出荷先住所２"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "EMPLOYEE", primary_key: "EMP_CODE", id: :string, limit: 10, comment: "社員コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "社員マスタ" do |t|
    t.string "EMP_NAME", limit: 20, comment: "社員名"
    t.string "EMP_KANA", limit: 40, comment: "社員名カナ"
    t.string "PASSWORD", limit: 8, comment: "パスワード"
    t.string "TEL", limit: 13, comment: "電話番号"
    t.string "FAX", limit: 13, comment: "FAX番号"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "開始日"
    t.string "OCCU_CODE", limit: 2, null: false, comment: "職種コード"
    t.string "APPROVAL_CODE", limit: 2, null: false, comment: "承認権限コード"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "INVOICE", primary_key: "INVOICE_NO", id: :string, limit: 10, comment: "請求番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "請求データ" do |t|
    t.datetime "INVOICED_DATE", comment: "請求日"
    t.string "COMP_CODE", limit: 8, null: false, comment: "取引先コード"
    t.integer "CUST_SUB_NO", comment: "顧客枝番"
    t.integer "LAST_RECEIVED", comment: "前回入金額"
    t.integer "MONTH_SALES", comment: "当月売上額"
    t.integer "MONTH_RECEIVED", comment: "当月入金額"
    t.integer "MONTH_INVOICE", comment: "当月請求額"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税金額"
    t.integer "INVOICE_RECEIVED", default: 0, comment: "請求消込金額"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "INVOICE_DETAILS", primary_key: ["INVOICE_NO", "SALES_NO", "ROW_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "請求データ明細" do |t|
    t.string "INVOICE_NO", limit: 10, null: false, comment: "請求番号"
    t.string "SALES_NO", limit: 10, null: false, comment: "売上番号"
    t.integer "ROW_NO", null: false, comment: "売上行番号"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "LOCATION", primary_key: ["WH_CODE", "LOCATION_CODE", "PROD_CODE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "棚番マスタ" do |t|
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.string "LOCATION_CODE", limit: 4, null: false, comment: "棚番コード"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["PROD_CODE"], name: "PROD_CODE"
  end

  create_table "OCCUPATION", primary_key: "OCCU_CODE", id: :string, limit: 2, comment: "職種コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "職種区分" do |t|
    t.string "OCCU_NAME", limit: 20, null: false, comment: "職種名"
  end

  create_table "ORDERS", primary_key: "ORDER_NO", id: :string, limit: 10, comment: "受注番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "受注データ" do |t|
    t.datetime "ORDER_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "受注日"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.string "CUST_CODE", limit: 8, null: false, comment: "顧客コード"
    t.integer "CUST_SUB_NO", comment: "顧客枝番"
    t.string "EMP_CODE", limit: 10, null: false, comment: "社員コード"
    t.datetime "REQUIRED_DATE", comment: "希望納期"
    t.string "CUSTORDER_NO", limit: 20, comment: "客先注文番号"
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.integer "ORDER_AMNT", default: 0, null: false, comment: "受注金額合計"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税金額"
    t.string "SLIP_COMMENT", limit: 1000, comment: "備考"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["CUST_CODE", "CUST_SUB_NO"], name: "CUST_CODE"
    t.index ["EMP_CODE"], name: "EMP_CODE"
    t.index ["WH_CODE"], name: "WH_CODE"
  end

  create_table "ORDER_DETAILS", primary_key: ["ORDER_NO", "SO_ROW_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "受注データ明細" do |t|
    t.string "ORDER_NO", limit: 10, null: false, comment: "受注番号"
    t.integer "SO_ROW_NO", null: false, comment: "受注行番号"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "PROD_NAME", limit: 10, null: false, comment: "商品名"
    t.integer "UNITPRICE", default: 0, null: false, comment: "販売単価"
    t.integer "QUANTITY", default: 1, null: false, comment: "受注数量"
    t.integer "CMP_TAX_RATE", comment: "消費税率"
    t.integer "RESERVE_QTY", default: 0, comment: "引当数量"
    t.integer "DELIVERY_ORDER_QTY", default: 0, comment: "出荷指示数量"
    t.integer "DELIVERED_QTY", default: 0, comment: "出荷済数量"
    t.integer "COMPLETE_FLG", default: 0, null: false, comment: "完了フラグ"
    t.integer "DISCOUNT", default: 0, null: false, comment: "値引金額"
    t.datetime "DELIVERY_DATE", comment: "納期"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "PAY", primary_key: "PAY_NO", id: :string, limit: 10, comment: "支払番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "支払データ" do |t|
    t.integer "PAY_DATE", comment: "支払日"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.string "SUP_CODE", limit: 8, null: false, comment: "仕入先コード"
    t.integer "SUP_SUB_NO", comment: "仕入先枝番"
    t.integer "PAY_METHOD_TYPE", default: 1, comment: "支払方法区分"
    t.integer "PAY_AMNT", comment: "支払金額"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税金額"
    t.integer "COMPLETE_FLG", default: 0, null: false, comment: "支払完了フラグ"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "開始日"
    t.index ["DEPT_CODE", "START_DATE"], name: "DEPT_CODE"
    t.index ["SUP_CODE", "SUP_SUB_NO"], name: "SUP_CODE"
  end

  create_table "PO_DETAILS", primary_key: ["PO_NO", "PO_ROW_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "発注データ明細" do |t|
    t.string "PO_NO", limit: 10, null: false, comment: "発注番号"
    t.integer "PO_ROW_NO", null: false, comment: "発注行番号"
    t.integer "PO_ROW_DSP_NO", null: false, comment: "発注行表示番号"
    t.string "ORDER_NO", limit: 10, null: false, comment: "受注番号"
    t.integer "SO_ROW_NO", null: false, comment: "受注行番号"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "PROD_NAME", limit: 10, null: false, comment: "商品名"
    t.integer "PO_PRICE", default: 0, comment: "仕入単価"
    t.integer "PO_QT", default: 1, null: false, comment: "発注数量"
    t.integer "RECIVED_QT", default: 1, null: false, comment: "入荷済数量"
    t.integer "COMPLETE_FLG", default: 0, null: false, comment: "完了フラグ"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "PRICEBYCUSTOMER", primary_key: ["PROD_CODE", "COMP_CODE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "顧客別販売単価" do |t|
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "COMP_CODE", limit: 8, null: false, comment: "取引先コード"
    t.integer "UNITPRICE", default: 0, null: false, comment: "販売単価"
    t.index ["COMP_CODE"], name: "COMP_CODE"
  end

  create_table "PRODUCTS", primary_key: "PROD_CODE", id: :string, limit: 16, comment: "商品コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品マスタ" do |t|
    t.string "PROD_FULLNAME", limit: 40, null: false, comment: "商品正式名"
    t.string "PROD_NAME", limit: 10, null: false, comment: "商品名"
    t.string "PROD_KANA", limit: 20, null: false, comment: "商品名カナ"
    t.string "PROD_TYPE", limit: 1, comment: "商品区分"
    t.string "SERIAL_NO", limit: 40, comment: "製品型番"
    t.integer "UNITPRICE", default: 0, null: false, comment: "販売単価"
    t.integer "PO_PRICE", default: 0, comment: "仕入単価"
    t.integer "COST", default: 0, null: false, comment: "売上原価"
    t.integer "TAX_TYPE", default: 1, null: false, comment: "税区分"
    t.string "CATEGORY_CODE", limit: 8, comment: "商品分類コード"
    t.integer "WIDE_USE_TYPE", comment: "雑区分"
    t.integer "STOCK_MANAGE_TYPE", default: 1, comment: "在庫管理対象区分"
    t.integer "STOCK_RESERVE_TYPE", comment: "在庫引当区分"
    t.string "SUP_CODE", limit: 8, null: false, comment: "仕入先コード"
    t.integer "SUP_SUB_NO", comment: "仕入先枝番"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "PRODUCT_CATEGORY", primary_key: "CATEGORY_CODE", id: :string, limit: 8, comment: "商品分類コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "商品分類マスタ" do |t|
    t.string "PROD_CATE_NAME", limit: 30, comment: "商品分類名"
    t.integer "LAYER", default: 0, null: false, comment: "階層"
    t.string "UPPER_CATEGORY", limit: 8, comment: "上位商品分類コード"
  end

  create_table "PURCHASE", primary_key: "PU_NO", id: :string, limit: 10, comment: "仕入番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "仕入データ" do |t|
    t.datetime "PU_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "仕入日"
    t.string "SUP_CODE", limit: 8, null: false, comment: "仕入先コード"
    t.integer "SUP_SUB_NO", comment: "仕入先枝番"
    t.string "EMP_CODE", limit: 10, null: false, comment: "仕入担当者コード"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.string "PO_NO", limit: 10, comment: "発注番号"
    t.integer "PU_AMMOUNT", comment: "仕入金額合計"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税金額"
    t.string "SLIP_COMMENT", limit: 1000, comment: "備考"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, comment: "開始日"
    t.index ["DEPT_CODE", "START_DATE"], name: "DEPT_CODE"
    t.index ["EMP_CODE"], name: "EMP_CODE"
  end

  create_table "PURCHASE_ORDERS", primary_key: "PO_NO", id: :string, limit: 10, comment: "発注番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "発注データ" do |t|
    t.datetime "PO_DATE", comment: "発注日"
    t.string "ORDER_NO", limit: 10, null: false, comment: "受注番号"
    t.string "SUP_CODE", limit: 8, null: false, comment: "仕入先コード"
    t.integer "SUP_SUB_NO", comment: "仕入先枝番"
    t.string "EMP_CODE", limit: 10, null: false, comment: "発注担当者コード"
    t.datetime "DUE_DATE", comment: "指定納期"
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.integer "PO_AMNT", comment: "発注金額合計"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税金額"
    t.string "SLIP_COMMENT", limit: 1000, comment: "備考"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["EMP_CODE"], name: "EMP_CODE"
  end

  create_table "PU_DETAILS", primary_key: ["PU_NO", "PU_ROW_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "仕入データ明細" do |t|
    t.string "PU_NO", limit: 10, null: false, comment: "仕入番号"
    t.integer "PU_ROW_NO", null: false, comment: "仕入行番号"
    t.integer "PU_ROW_DSP_NO", null: false, comment: "仕入行表示番号"
    t.integer "PO_ROW_NO", null: false, comment: "発注行番号"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.string "PROD_NAME", limit: 10, null: false, comment: "商品名"
    t.integer "PO_PRICE", default: 0, comment: "仕入単価"
    t.integer "PU_QUANTITY", default: 1, null: false, comment: "仕入数量"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.index ["PROD_CODE"], name: "PROD_CODE"
    t.index ["WH_CODE"], name: "WH_CODE"
  end

  create_table "SALES", primary_key: "SALES_NO", id: :string, limit: 10, comment: "売上番号", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "売上データ" do |t|
    t.string "ORDER_NO", limit: 10, null: false, comment: "受注番号"
    t.datetime "SALES_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "売上日"
    t.integer "SALES_TYPE", default: 1, comment: "売上区分"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.string "COMP_CODE", limit: 8, null: false, comment: "取引先コード"
    t.string "EMP_CODE", limit: 10, null: false, comment: "社員コード"
    t.integer "SALES_AMNT", default: 0, null: false, comment: "売上金額合計"
    t.integer "CMP_TAX", default: 0, null: false, comment: "消費税合計"
    t.string "SLIP_COMMENT", limit: 1000, comment: "備考"
    t.integer "UPDATED_NO", comment: "赤黒伝票番号"
    t.string "ORGNL_NO", limit: 10, comment: "元伝票番号"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "SALES_DETAILS", primary_key: ["SALES_NO", "ROW_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "売上データ明細" do |t|
    t.string "SALES_NO", limit: 10, null: false, comment: "売上番号"
    t.integer "ROW_NO", null: false, comment: "売上行番号"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "PROD_NAME", limit: 10, null: false, comment: "商品名"
    t.integer "UNITPRICE", default: 0, null: false, comment: "販売単価"
    t.integer "DELIVERED_QTY", default: 0, comment: "出荷数量"
    t.integer "QUANTITY", default: 1, null: false, comment: "売上数量"
    t.integer "DISCOUNT", default: 0, null: false, comment: "値引金額"
    t.datetime "INVOICED_DATE", comment: "請求日"
    t.string "INVOICE_NO", limit: 10, comment: "請求番号"
    t.integer "INVOICE_DELAY_TYPE", comment: "請求遅延区分"
    t.datetime "AUTO_JOURNAL_DATE", comment: "自動仕訳処理日"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "STOCK", primary_key: ["WH_CODE", "PROD_CODE", "ROT_NO", "STOCK_TYPE", "QUALITY_TYPE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "在庫データ" do |t|
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.string "PROD_CODE", limit: 16, null: false, comment: "商品コード"
    t.string "ROT_NO", limit: 20, null: false, comment: "ロット番号"
    t.string "STOCK_TYPE", limit: 1, default: "1", null: false, comment: "在庫区分"
    t.string "QUALITY_TYPE", limit: 1, default: "G", null: false, comment: "良品区分"
    t.integer "ACTUAL", default: 1, null: false, comment: "実在庫数"
    t.integer "VALID", default: 1, null: false, comment: "有効在庫数"
    t.datetime "LAST_DELIVERY_DATE", comment: "最終出荷日"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "SUPPLIER_MST", primary_key: ["SUP_CODE", "SUP_SUB_NO"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "仕入先マスタ" do |t|
    t.string "SUP_CODE", limit: 8, null: false, comment: "仕入先コード"
    t.integer "SUP_SUB_NO", null: false, comment: "仕入先枝番"
    t.string "SUP_NAME", limit: 40, null: false, comment: "仕入先名"
    t.string "SUP_KANA", limit: 40, comment: "仕入先名カナ"
    t.string "SUP_EMP_NAME", limit: 20, comment: "仕入先担当者名"
    t.string "SUP_DEP_NAME", limit: 40, comment: "仕入先部門名"
    t.string "SUP_ZIP_CODE", limit: 8, comment: "仕入先郵便番号"
    t.string "SUP_STATE", limit: 4, comment: "仕入先都道府県"
    t.string "SUP_ADDRESS1", limit: 40, comment: "仕入先住所１"
    t.string "SUP_ADDRESS2", limit: 40, comment: "仕入先住所２"
    t.string "SUP_TEL", limit: 13, comment: "仕入先電話番号"
    t.string "SUP_FAX", limit: 13, comment: "仕入先FAX番号"
    t.string "SUP_EMAIL", limit: 100, comment: "仕入先メールアドレス"
    t.integer "SUP_CLOSE_DATE", null: false, comment: "仕入先締日"
    t.integer "SUP_PAY_MONTHS", default: 1, comment: "仕入先支払月"
    t.integer "SUP_PAY_DATES", comment: "仕入先支払日"
    t.integer "PAY_METHOD_TYPE", default: 1, comment: "支払方法区分"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  create_table "WH_DEPT_MST", primary_key: ["WH_CODE", "DEPT_CODE", "START_DATE"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "倉庫部門マスタ" do |t|
    t.string "WH_CODE", limit: 3, null: false, comment: "倉庫コード"
    t.string "DEPT_CODE", limit: 5, null: false, comment: "部門コード"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
    t.datetime "START_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "開始日"
    t.index ["DEPT_CODE", "START_DATE"], name: "DEPT_CODE"
  end

  create_table "WH_MST", primary_key: "WH_CODE", id: :string, limit: 3, comment: "倉庫コード", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "倉庫マスタ" do |t|
    t.string "WH_NAME", limit: 20, comment: "倉庫名"
    t.string "WH_TYPE", limit: 1, default: "N", comment: "倉庫区分"
    t.string "ZIP_CODE", limit: 8, comment: "郵便番号"
    t.string "STATE", limit: 4, comment: "都道府県"
    t.string "ADDRESS1", limit: 40, comment: "住所１"
    t.string "ADDRESS2", limit: 40, comment: "住所２"
    t.datetime "UPDATE_DATE", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新日時"
    t.string "UPDATER", limit: 12, comment: "更新者名"
  end

  add_foreign_key "BANK", "DEPT_MST", column: "DEPT_CODE", primary_key: "DEPT_CODE", name: "BANK_ibfk_1"
  add_foreign_key "BANK", "DEPT_MST", column: "START_DATE", primary_key: "START_DATE", name: "BANK_ibfk_1"
  add_foreign_key "BOM", "PRODUCTS", column: "PROD_CODE", primary_key: "PROD_CODE", name: "BOM_ibfk_1"
  add_foreign_key "COMPANY_CATEGORY", "CATEGORY_TYPE", column: "CATEGORY_TYPE", primary_key: "CATEGORY_TYPE_CODE", name: "COMPANY_CATEGORY_ibfk_1"
  add_foreign_key "COMPANY_CATEGORY_GROUP", "COMPANY_CATEGORY", column: "CATEGORY_TYPE", primary_key: "CATEGORY_TYPE", name: "COMPANY_CATEGORY_GROUP_ibfk_1"
  add_foreign_key "COMPANY_CATEGORY_GROUP", "COMPANY_CATEGORY", column: "COMP_CATE_CODE", primary_key: "COMP_CATE_CODE", name: "COMPANY_CATEGORY_GROUP_ibfk_1"
  add_foreign_key "CREDIT", "DEPT_MST", column: "DEPT_CODE", primary_key: "DEPT_CODE", name: "CREDIT_ibfk_1"
  add_foreign_key "CREDIT", "DEPT_MST", column: "START_DATE", primary_key: "START_DATE", name: "CREDIT_ibfk_1"
  add_foreign_key "CREDIT_BALANCE", "COMPANYS_MST", column: "COMP_CODE", primary_key: "COMP_CODE", name: "CREDIT_BALANCE_ibfk_1"
  add_foreign_key "CUSTOMERS_MST", "COMPANYS_MST", column: "CUST_CODE", primary_key: "COMP_CODE", name: "CUSTOMERS_MST_ibfk_1"
  add_foreign_key "INVOICE_DETAILS", "INVOICE", column: "INVOICE_NO", primary_key: "INVOICE_NO", name: "INVOICE_DETAILS_ibfk_1"
  add_foreign_key "LOCATION", "PRODUCTS", column: "PROD_CODE", primary_key: "PROD_CODE", name: "LOCATION_ibfk_2"
  add_foreign_key "LOCATION", "WH_MST", column: "WH_CODE", primary_key: "WH_CODE", name: "LOCATION_ibfk_1"
  add_foreign_key "ORDERS", "CUSTOMERS_MST", column: "CUST_CODE", primary_key: "CUST_CODE", name: "ORDERS_ibfk_2"
  add_foreign_key "ORDERS", "CUSTOMERS_MST", column: "CUST_SUB_NO", primary_key: "CUST_SUB_NO", name: "ORDERS_ibfk_2"
  add_foreign_key "ORDERS", "EMPLOYEE", column: "EMP_CODE", primary_key: "EMP_CODE", name: "ORDERS_ibfk_1"
  add_foreign_key "ORDERS", "WH_MST", column: "WH_CODE", primary_key: "WH_CODE", name: "ORDERS_ibfk_3"
  add_foreign_key "ORDER_DETAILS", "ORDERS", column: "ORDER_NO", primary_key: "ORDER_NO", name: "ORDER_DETAILS_ibfk_1"
  add_foreign_key "PAY", "DEPT_MST", column: "DEPT_CODE", primary_key: "DEPT_CODE", name: "PAY_ibfk_2"
  add_foreign_key "PAY", "DEPT_MST", column: "START_DATE", primary_key: "START_DATE", name: "PAY_ibfk_2"
  add_foreign_key "PAY", "SUPPLIER_MST", column: "SUP_CODE", primary_key: "SUP_CODE", name: "PAY_ibfk_1"
  add_foreign_key "PAY", "SUPPLIER_MST", column: "SUP_SUB_NO", primary_key: "SUP_SUB_NO", name: "PAY_ibfk_1"
  add_foreign_key "PO_DETAILS", "PURCHASE_ORDERS", column: "PO_NO", primary_key: "PO_NO", name: "PO_DETAILS_ibfk_1"
  add_foreign_key "PRICEBYCUSTOMER", "COMPANYS_MST", column: "COMP_CODE", primary_key: "COMP_CODE", name: "PRICEBYCUSTOMER_ibfk_1"
  add_foreign_key "PURCHASE", "DEPT_MST", column: "DEPT_CODE", primary_key: "DEPT_CODE", name: "PURCHASE_ibfk_2"
  add_foreign_key "PURCHASE", "DEPT_MST", column: "START_DATE", primary_key: "START_DATE", name: "PURCHASE_ibfk_2"
  add_foreign_key "PURCHASE", "EMPLOYEE", column: "EMP_CODE", primary_key: "EMP_CODE", name: "PURCHASE_ibfk_1"
  add_foreign_key "PURCHASE_ORDERS", "EMPLOYEE", column: "EMP_CODE", primary_key: "EMP_CODE", name: "PURCHASE_ORDERS_ibfk_1"
  add_foreign_key "PU_DETAILS", "PRODUCTS", column: "PROD_CODE", primary_key: "PROD_CODE", name: "PU_DETAILS_ibfk_2"
  add_foreign_key "PU_DETAILS", "PURCHASE", column: "PU_NO", primary_key: "PU_NO", name: "PU_DETAILS_ibfk_1"
  add_foreign_key "PU_DETAILS", "WH_MST", column: "WH_CODE", primary_key: "WH_CODE", name: "PU_DETAILS_ibfk_3"
  add_foreign_key "SALES_DETAILS", "SALES", column: "SALES_NO", primary_key: "SALES_NO", name: "SALES_DETAILS_ibfk_1"
  add_foreign_key "STOCK", "WH_MST", column: "WH_CODE", primary_key: "WH_CODE", name: "STOCK_ibfk_1"
  add_foreign_key "SUPPLIER_MST", "COMPANYS_MST", column: "SUP_CODE", primary_key: "COMP_CODE", name: "SUPPLIER_MST_ibfk_1"
  add_foreign_key "WH_DEPT_MST", "DEPT_MST", column: "DEPT_CODE", primary_key: "DEPT_CODE", name: "WH_DEPT_MST_ibfk_2"
  add_foreign_key "WH_DEPT_MST", "DEPT_MST", column: "START_DATE", primary_key: "START_DATE", name: "WH_DEPT_MST_ibfk_2"
  add_foreign_key "WH_DEPT_MST", "WH_MST", column: "WH_CODE", primary_key: "WH_CODE", name: "WH_DEPT_MST_ibfk_1"
end
