// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    int id;
    String name;
    String url;
    String description;
    String link;
    String slug;
    Map<String, String> avatarUrls;
    List<dynamic> meta;
    WoocommerceMeta woocommerceMeta;
    Links links;

    User({
        this.id,
        this.name,
        this.url,
        this.description,
        this.link,
        this.slug,
        this.avatarUrls,
        this.meta,
        this.woocommerceMeta,
        this.links,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        woocommerceMeta: WoocommerceMeta.fromJson(json["woocommerce_meta"]),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "woocommerce_meta": woocommerceMeta.toJson(),
        "_links": links.toJson(),
    };
}

class Links {
    List<Collection> self;
    List<Collection> collection;

    Links({
        this.self,
        this.collection,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class Collection {
    String href;

    Collection({
        this.href,
    });

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class WoocommerceMeta {
    String activityPanelInboxLastRead;
    String activityPanelReviewsLastRead;
    String categoriesReportColumns;
    String couponsReportColumns;
    String customersReportColumns;
    String ordersReportColumns;
    String productsReportColumns;
    String revenueReportColumns;
    String taxesReportColumns;
    String variationsReportColumns;
    String dashboardSections;
    String dashboardChartType;
    String dashboardChartInterval;
    String dashboardLeaderboardRows;

    WoocommerceMeta({
        this.activityPanelInboxLastRead,
        this.activityPanelReviewsLastRead,
        this.categoriesReportColumns,
        this.couponsReportColumns,
        this.customersReportColumns,
        this.ordersReportColumns,
        this.productsReportColumns,
        this.revenueReportColumns,
        this.taxesReportColumns,
        this.variationsReportColumns,
        this.dashboardSections,
        this.dashboardChartType,
        this.dashboardChartInterval,
        this.dashboardLeaderboardRows,
    });

    factory WoocommerceMeta.fromJson(Map<String, dynamic> json) => WoocommerceMeta(
        activityPanelInboxLastRead: json["activity_panel_inbox_last_read"],
        activityPanelReviewsLastRead: json["activity_panel_reviews_last_read"],
        categoriesReportColumns: json["categories_report_columns"],
        couponsReportColumns: json["coupons_report_columns"],
        customersReportColumns: json["customers_report_columns"],
        ordersReportColumns: json["orders_report_columns"],
        productsReportColumns: json["products_report_columns"],
        revenueReportColumns: json["revenue_report_columns"],
        taxesReportColumns: json["taxes_report_columns"],
        variationsReportColumns: json["variations_report_columns"],
        dashboardSections: json["dashboard_sections"],
        dashboardChartType: json["dashboard_chart_type"],
        dashboardChartInterval: json["dashboard_chart_interval"],
        dashboardLeaderboardRows: json["dashboard_leaderboard_rows"],
    );

    Map<String, dynamic> toJson() => {
        "activity_panel_inbox_last_read": activityPanelInboxLastRead,
        "activity_panel_reviews_last_read": activityPanelReviewsLastRead,
        "categories_report_columns": categoriesReportColumns,
        "coupons_report_columns": couponsReportColumns,
        "customers_report_columns": customersReportColumns,
        "orders_report_columns": ordersReportColumns,
        "products_report_columns": productsReportColumns,
        "revenue_report_columns": revenueReportColumns,
        "taxes_report_columns": taxesReportColumns,
        "variations_report_columns": variationsReportColumns,
        "dashboard_sections": dashboardSections,
        "dashboard_chart_type": dashboardChartType,
        "dashboard_chart_interval": dashboardChartInterval,
        "dashboard_leaderboard_rows": dashboardLeaderboardRows,
    };
}
