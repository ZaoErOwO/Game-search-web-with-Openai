
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;

import com.icss.action.GameAction;
import com.icss.action.NewsAction;
import com.icss.action.SearchAction;
import com.icss.action.UserAction;
import com.icss.biz.FavoritesBiz;
import com.icss.biz.GameBiz;
import com.icss.biz.NewsBiz;
import com.icss.biz.OpenAiService;
import com.icss.biz.UserBiz;
import com.icss.entity.Comments;
import com.icss.entity.Game;
import com.icss.entity.GameType;
import com.icss.entity.News;
import com.icss.entity.User;

import jakarta.servlet.http.HttpSession;
class ControllerTest {
	private MockMvc mockMvc1;
	private MockMvc mockMvc2;
	private MockMvc mockMvc3;
	private MockMvc mockMvc4;
    @InjectMocks
    private GameAction gameaction;
    @InjectMocks
    private UserAction useraction;
    @InjectMocks
    private NewsAction newsaction;
    @InjectMocks
    private SearchAction searchaction;
    @Mock
    private GameBiz gameBiz;
    @Mock
    private NewsBiz newsBiz;
    @Mock
    private OpenAiService openAiService;
    @Mock
    private FavoritesBiz favoritesBiz;
    @Mock
    private UserBiz userBiz;
    @Mock
    private Model model;
    @Mock
    private HttpSession session;
    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        this.mockMvc1 = MockMvcBuilders.standaloneSetup(gameaction).build();
        this.mockMvc2 = MockMvcBuilders.standaloneSetup(useraction).build();
        this.mockMvc3 = MockMvcBuilders.standaloneSetup(newsaction).build();
        this.mockMvc4 = MockMvcBuilders.standaloneSetup(searchaction).build();
    }
    @Test
    public void testGetGameList() throws Exception {
        when(gameBiz.getAllGames()).thenReturn(Arrays.asList(new Game()));
        when(gameBiz.getAllTypes()).thenReturn(Arrays.asList(new GameType()));

        mockMvc1.perform(get("/gamelist"))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/gamelibrary.jsp"));

        verify(gameBiz, times(1)).getAllGames();
        verify(gameBiz, times(1)).getAllTypes();
    }
    @Test
    public void testGetBookInfo() throws Exception {
        String gname = "someGameName";
        when(session.getAttribute("user")).thenReturn(new User());
        when(gameBiz.getGameModel(gname)).thenReturn(new Game());
        when(gameBiz.getGameAllComments(gname)).thenReturn(Arrays.asList(new Comments()));
        when(newsBiz.getNew0_3()).thenReturn(Arrays.asList(new News()));

        mockMvc1.perform(get("/gameinfo").param("gname", gname))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/gameinfo.jsp"));

        verify(gameBiz, times(1)).getGameModel(gname);
        verify(gameBiz, times(1)).getGameAllComments(gname);
        verify(newsBiz, times(1)).getNew0_3();
    }
    @Test
    public void testGetTypeGame() throws Exception {
        String tname = "someType";
        when(gameBiz.getTypeGame(tname)).thenReturn(Arrays.asList(new Game()));
        when(gameBiz.getAllTypes()).thenReturn(Arrays.asList(new GameType()));

        mockMvc1.perform(get("/gametype").param("tname", tname))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/gamelibrary.jsp"));

        verify(gameBiz, times(1)).getTypeGame(tname);
        verify(gameBiz, times(1)).getAllTypes();
    }
    @Test
    public void testSearchGame() throws Exception {
        String gname = "someGameName";
        String analyzedGameName = "analyzedName";
        when(openAiService.getGameName(gname)).thenReturn(analyzedGameName);
        when(gameBiz.searchGame(analyzedGameName)).thenReturn(Arrays.asList(new Game()));
        when(gameBiz.getAllTypes()).thenReturn(Arrays.asList(new GameType()));
        mockMvc1.perform(get("/searchgame").param("gname", gname))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/gamelibrary.jsp"));
        verify(gameBiz, times(1)).searchGame(analyzedGameName);
        verify(gameBiz, times(1)).getAllTypes();
    }
   


    
    
    
    
    
    
    
    
    
    
    @Test
    public void testGetUser() throws Exception {
        User mockUser = new User();
        mockUser.setUname("testUser");
        
        when(favoritesBiz.getAllFavorites(mockUser.getUname())).thenReturn(new ArrayList<>());
        
        mockMvc2.perform(get("/user").sessionAttr("user", mockUser))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/individual.jsp"));
    }
    @Test
    public void testLoginGet() throws Exception {
        mockMvc2.perform(get("/login"))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/login.jsp"));
    }
    @Test
    public void testLoginPostSuccess() throws Exception {
        User mockUser = new User();
        mockUser.setUname("testUser");
        mockUser.setPwd("password");

        when(userBiz.login("testUser", "password")).thenReturn(mockUser);

        mockMvc2.perform(post("/login").param("uname", "testUser").param("pwd", "password"))
               .andExpect(status().isOk())
               .andExpect(content().string("1"));
    }

    @Test
    public void testLoginPostFail() throws Exception {
        when(userBiz.login("testUser", "wrongPassword")).thenReturn(null);

        mockMvc2.perform(post("/login").param("uname", "testUser").param("pwd", "wrongPassword"))
               .andExpect(status().isOk())
               .andExpect(content().string("0"));
    }
    @Test
    public void testCollection() throws Exception {
        User mockUser = new User();
        mockUser.setUname("testUser");

        String gname = "gameName";
        
        when(favoritesBiz.getAllFavorites(mockUser.getUname())).thenReturn(new ArrayList<>());

        mockMvc2.perform(get("/user/collection")
                        .sessionAttr("user", mockUser)
                        .param("gname", gname))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/individual.jsp"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("fas"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("msg"));
    }
    @Test
    public void testRemoveCollection() throws Exception {
        User mockUser = new User();
        mockUser.setUname("testUser");

        String gname = "gameName";
        
        when(favoritesBiz.getAllFavorites(mockUser.getUname())).thenReturn(new ArrayList<>());
        when(gameBiz.getGameModel(gname)).thenReturn(new Game());

        mockMvc2.perform(get("/user/removecollection")
                        .sessionAttr("user", mockUser)
                        .param("gname", gname))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/individual.jsp"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("fas"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("msg"));
    }
    @Test
    public void testLogout() throws Exception {
        mockMvc2.perform(get("/user/logout"))
               .andExpect(status().is3xxRedirection())
               .andExpect(redirectedUrlPattern("**/app/login"));
    }

    
    
    
    
    
    
    
    @Test
    public void testGetAllNews() throws Exception {
        List<News> mockNewsList = Arrays.asList(new News(), new News());
        when(newsBiz.getAllNews()).thenReturn(mockNewsList);
        mockMvc3.perform(get("/newslist"))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/new.jsp"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("news"));
        verify(newsBiz, times(1)).getAllNews();
    }
    @Test
    public void testGetBookInfo1() throws Exception {
        String nid = "someNid";
        News mockNews = new News();
        when(newsBiz.getNewsModel(nid)).thenReturn(mockNews);
        mockMvc3.perform(get("/newsinfo").param("nid", nid))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/newdetail.jsp"))
               .andExpect(MockMvcResultMatchers.model().attributeExists("news"));
        verify(newsBiz, times(1)).getNewsModel(nid);
    }

    
    
    
    
    @Test
    public void testGetSearch() throws Exception {
        List<News> mockNewsList1 = Arrays.asList(new News(), new News(), new News(), new News(), new News());
        List<News> mockNewsList2 = Arrays.asList(new News(), new News(), new News(), new News(), new News());
        when(newsBiz.getNew0_4()).thenReturn(mockNewsList1);
        when(newsBiz.getNew4_8()).thenReturn(mockNewsList2);
        mockMvc4.perform(get("/search"))
               .andExpect(status().isOk())
               .andExpect(view().name("/jsp/search.jsp"))
               .andExpect(MockMvcResultMatchers.model().attribute("news1", mockNewsList1))
               .andExpect(MockMvcResultMatchers.model().attribute("news2", mockNewsList2));
        verify(newsBiz, times(1)).getNew0_4();
        verify(newsBiz, times(1)).getNew4_8();
    }

    
    
    
    
}
