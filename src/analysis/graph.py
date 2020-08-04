import analysis.v_module
class graph:

        modules = {}
        covered_types = []
        covered_inst = []

        def __init__(self):
            super().__init__()

        def __init__(self, in_data):
                super().__init__()
                self.add_type(in_data)

        def add_type(self, in_data):
                for i in in_data["modules"]:
                        self.modules[i["module"]] = v_module(i)
                self.covered_types.append(in_data["instruction type"])

        def add_inst(self, in_data):
                for i in in_data["delta"]:
                        self.modules[i["module"]].add_code(i["delta"])
                self.covered_inst.append(in_data["instruction"])

        def merge(self, in_graph):
            cur_modules = set(get_module_names(self.modules))
            in_modules = set(get_module_names(in_graph["modules"]))
            missing = cur_modules - in_modules
            temp_dic = {}
            for i in missing:
                temp_dic[i] = v_module(in_graph["modules"][i])
            self.modules.update(temp_dic)
            common = cur_modules & in_modules
            for i in common:
                self.modules[i].merge(in_graph["modules"][i])

            
        def get_module_names(self,in_graph):
            ret = []
            for i in in_graph:
                ret.append(i["module"])
            return ret