﻿using HuoHuan.Models;
using HuoHuan.Util;
using System.Collections.Generic;
using System.IO;

namespace HuoHuan.Data
{
    class SpiderKey
    {
        internal static List<SpiderData> TiebaDatas => YamlUtil.Deserializer<List<SpiderData>>(File.ReadAllText("Data//tieba_spider_key.yaml"));
    }
}