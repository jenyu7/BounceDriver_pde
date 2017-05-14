        if (!b.checkShrink())
            {
              b.grow();
              if (b.rad == 100)
              {
                b.stage = 1;
              }
            }
            if (!p.checkShrink())
            {
              p.grow();
              if (p.rad == 100)
              {
                p.stage = 1;
              }
            }
          }
        }
        
        if (b.stage == 1 || p.stage == 1)
        {
          if (!b.checkDead())
          {
            b.shrink();
            if (b.rad == 2)
            {
              b.stage = 2;
            }
          }
          if (!p.checkDead())
          {
            p.shrink();
            if (p.rad == 2)
            {
              p.stage = 2;
            }
          }
        }
        if (b.stage == 2 || p.stage == 2)
        {
          if (b.checkDead())
          {
            b.rad = 0;
          }
          if (p.checkDead())
          {
            p.rad = 0;
          }
        }
       }  