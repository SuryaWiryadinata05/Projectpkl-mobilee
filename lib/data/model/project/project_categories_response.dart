// class ProjectResponse {
//   int? status;
//   Data? data;
//   Params? params;
//   String? message;
//   List<Dataa>? dataa;
//   Null? errors;

//   ProjectResponse(
//       {this.status, this.data, this.dataa,this.params, this.message, this.errors});

//   ProjectResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     params =
//         json['params'] != null ? new Params.fromJson(json['params']) : null;
//     message = json['message'];
//     errors = json['errors'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     if (this.params != null) {
//       data['params'] = this.params!.toJson();
//     }
//     data['message'] = this.message;
//     data['errors'] = this.errors;
//     return data;
//   }
// }

// class Data {
//   int? count;
//   int? offset;
//   int? limit;
//   int? currentPage;
//   int? pageCount;
//   List<Dataa>? dataa;

//   Data(
//       {this.count,
//       this.offset,
//       this.limit,
//       this.currentPage,
//       this.pageCount,
//       this.dataa});

//   Data.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     offset = json['offset'];
//     limit = json['limit'];
//     currentPage = json['currentPage'];
//     pageCount = json['pageCount'];
//     if (json['dataa'] != null) {
//       dataa = <Dataa>[];
//       json['dataa'].forEach((v) {
//         dataa!.add(new Dataa.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['offset'] = this.offset;
//     data['limit'] = this.limit;
//     data['currentPage'] = this.currentPage;
//     data['pageCount'] = this.pageCount;
//     if (this.dataa != null) {
//       data['dataa'] = this.dataa!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Dataa {
//   int? id;
//   int? tenantId;
//   int? createdBy;
//   int? updatedBy;
//   String? name;
//   String? description;
//   String? createdAt;
//   String? updatedAt;

//   Dataa(
//       {this.id,
//       this.tenantId,
//       this.createdBy,
//       this.updatedBy,
//       this.name,
//       this.description,
//       this.createdAt,
//       this.updatedAt});

//   Dataa.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tenantId = json['tenant_id'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     name = json['name'];
//     description = json['description'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['tenant_id'] = this.tenantId;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Params {
//   List<Null>? all;
//   Query? query;
//   List<Null>? filter;
//   List<Null>? orderBy;

//   Params({this.all, this.query, this.filter, this.orderBy});

//   Params.fromJson(Map<String, dynamic> json) {
//     if (json['all'] != null) {
//       all = <Null>[];
//       json['all'].forEach((v) {
//         all!.add((v));
//       });
//     }
//     query = json['query'] != null ? new Query.fromJson(json['query']) : null;
//     if (json['filter'] != null) {
//       filter = <Null>[];
//       json['filter'].forEach((v) {
//         filter!.add((v));
//       });
//     }
//     if (json['orderBy'] != null) {
//       orderBy = <Null>[];
//       json['orderBy'].forEach((v) {
//         orderBy!.add((v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.all != null) {
//       data['all'] = this.all!.map((v) => (v)).toList();
//     }
//     if (this.query != null) {
//       data['query'] = this.query!.toJson();
//     }
//     if (this.filter != null) {
//       data['filter'] = this.filter!.map((v) => (v)).toList();
//     }
//     if (this.orderBy != null) {
//       data['orderBy'] = this.orderBy!.map((v) => (v)).toList();
//     }
//     return data;
//   }
// }

// class Query {
//   String? limit;
//   String? offset;

//   Query({this.limit, this.offset});

//   Query.fromJson(Map<String, dynamic> json) {
//     limit = json['limit'];
//     offset = json['offset'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['limit'] = this.limit;
//     data['offset'] = this.offset;
//     return data;
//   }
// }


class ProjectResponse {
  int? status;
  List<Data2>? data;
  Params? params;
  String? message;
  Null? errors;

  ProjectResponse(
      {this.status, this.data, this.params, this.message, this.errors});

  ProjectResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}

class Data2 {
  int? id;
  int? tenantId;
  int? createdBy;
  int? updatedBy;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data2(
      {this.id,
      this.tenantId,
      this.createdBy,
      this.updatedBy,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Params {
  List<Null>? all;
  Query? query;
  List<Null>? filter;
  List<Null>? orderBy;

  Params({this.all, this.query, this.filter, this.orderBy});

  Params.fromJson(Map<String, dynamic> json) {
    if (json['all'] != null) {
      all = <Null>[];
      json['all'].forEach((v) {
        all!.add((v));
      });
    }
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    if (json['filter'] != null) {
      filter = <Null>[];
      json['filter'].forEach((v) {
        filter!.add((v));
      });
    }
    if (json['orderBy'] != null) {
      orderBy = <Null>[];
      json['orderBy'].forEach((v) {
        orderBy!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.all != null) {
      data['all'] = this.all!.map((v) => (v)).toList();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    if (this.filter != null) {
      data['filter'] = this.filter!.map((v) => (v)).toList();
    }
    if (this.orderBy != null) {
      data['orderBy'] = this.orderBy!.map((v) => (v)).toList();
    }
    return data;
  }
}

class Query {
  String? limit;
  String? offset;

  Query({this.limit, this.offset});

  Query.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}
