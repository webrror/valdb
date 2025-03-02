import 'package:flutter/material.dart';
import 'package:valdb/models/agents_model.dart';
import 'package:valdb/services/fetch_service.dart';

class DataProvider extends ChangeNotifier {
  bool isAgentsLoading = false;
  setIsAgentsLoading(bool value) {
    isAgentsLoading = value;
    notifyListeners();
  }

  List<AgentDetailModel> agents = [];
  setAgents(List<AgentDetailModel> value) {
    agents = value;
    if (agents.isNotEmpty) {
      agents.sort((a, b) => (a.displayName ?? "").compareTo(b.displayName ?? ""));
    }
    notifyListeners();
  }

  Future<void> fetchAgents() async {
    try {
      setIsAgentsLoading(true);
      FetchService fetchService = FetchService();
      setAgents(await fetchService.fetchAgents());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setIsAgentsLoading(false);
    }
  }
}
