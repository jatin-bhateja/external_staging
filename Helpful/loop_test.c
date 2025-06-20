
// Iterative DFS over graph.
bool RegionNode::is_self_loop(Node* start, PhaseGVN* phase) {
  VectorSet visited;
  Node_Stack nstack(phase->C->live_nodes() >> 1);

  nstack.push(start, start->isa_Proj() ? 0 : 1);
  visited.set(start->_idx);
  while(nstack.size()) {
    Node* n  = nstack.node();
    uint idx = nstack.index();
    if (!n->is_Root() && !n->is_top() && idx < n->req()) {
      Node* def = n->in(idx);
      if (def == NULL) {
        nstack.set_index(idx+1);
      } else if (visited.test_set(def->_idx)) {
        def->dump(100);
        return true;
      } else {
        nstack.set_index(idx+1);
        visited.set(def->_idx);
        nstack.push(def, def->isa_Proj() ? 0 : 1);
      }
    } else {
      visited.remove(n->_idx);
      nstack.pop();
    }
  }
  return false;
}

