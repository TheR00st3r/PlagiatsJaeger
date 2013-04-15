package System.Backend.Interfaces;

import java.util.HashSet;
import System.Backend.Classes.SearchResult;
import java.util.ArrayList;


/**
 *  Description of the interface IComparer.
 *
 *
 */
public interface IComparer {


    /**
     *  Description of the method compareText.
     *
     *
     * @param originalText
     * @param textToCheck
     * @return result
     */
    public HashSet<SearchResult> compareText(String originalText, String textToCheck) ;

    /**
     *  Description of the method compareFiles.
     *
     *
     * @param filePathSource
     * @param filePathToCheck
     * @return result
     */
    public HashSet<SearchResult> compareFiles(String filePathSource, String filePathToCheck) ;

    /**
     *  Description of the method checkIfZitat.
     *
     *
     * @param link
     * @return result
     */
    private boolean checkIfZitat(String link) ;

}